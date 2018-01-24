<?php
require_once ("Secure_area.php");
class Receivings extends Secure_area
{
	function __construct()
	{
		parent::__construct('receivings');
		$this->load->library('receiving_lib');
		$this->load->library('barcode_lib');
	}

	function index()
	{
		$this->_reload();
	}

	function item_search()
	{
		$suggestions = $this->Item->get_search_suggestions($this->input->get('term'), array(
			'search_custom' => FALSE, 'is_deleted' => FALSE
		), TRUE);
		$suggestions = array_merge($suggestions, $this->Item_kit->get_search_suggestions($this->input->get('term')));
		echo json_encode($suggestions);
	}

	function select_supplier()
	{
		$supplier_id = $this->input->post('supplier');
		if ($this->Supplier->exists($supplier_id))
		{
			$this->receiving_lib->set_supplier($supplier_id);
		}
		$this->_reload();
	}

	function change_mode()
	{
		$stock_destination = $this->input->post('stock_destination');
		$stock_source = $this->input->post('stock_source');
		if ((!$stock_source || $stock_source == $this->receiving_lib->get_stock_source()) &&
			(!$stock_destination || $stock_destination == $this->receiving_lib->get_stock_destination()))
		{
			$this->receiving_lib->clear_invoice_number();
			$mode = $this->input->post('mode');
			$this->receiving_lib->set_mode($mode);
		}
		else if ($this->Stock_location->is_allowed_location($stock_source, 'receivings'))
		{
			$this->receiving_lib->set_stock_source($stock_source);
			$this->receiving_lib->set_stock_destination($stock_destination);
		}
		$this->_reload();
	}
	
	function set_comment()
	{
		$this->receiving_lib->set_comment($this->input->post('comment'));
	}
	
	function set_invoice_number_enabled()
	{
		$this->receiving_lib->set_invoice_number_enabled($this->input->post('recv_invoice_number_enabled'));
	}
	
	function set_print_after_sale()
	{
		$this->receiving_lib->set_print_after_sale($this->input->post('recv_print_after_sale'));
	}
	
	function set_invoice_number()
	{
		$this->receiving_lib->set_invoice_number($this->input->post('recv_invoice_number'));
	}
	
	function add()
	{
		$data=array();
		$mode = $this->receiving_lib->get_mode();
		$item_id_or_number_or_item_kit_or_receipt = $this->input->post('item');
		$quantity = ($mode=="receive" or $mode=="requisition") ? 1 : -1;
		$item_location = $this->receiving_lib->get_stock_source();
		if($mode=='return' && $this->receiving_lib->is_valid_receipt($item_id_or_number_or_item_kit_or_receipt))
		{
			$this->receiving_lib->return_entire_receiving($item_id_or_number_or_item_kit_or_receipt);
		}
		elseif($this->receiving_lib->is_valid_item_kit($item_id_or_number_or_item_kit_or_receipt))
		{
			$this->receiving_lib->add_item_kit($item_id_or_number_or_item_kit_or_receipt,$item_location);
		}
		else
		{
            if(!$this->receiving_lib->add_item($item_id_or_number_or_item_kit_or_receipt,$quantity,$item_location))
                   $data['error']=$this->lang->line('recvs_unable_to_add_item');
		}
		$this->_reload($data);
	}

	function edit_item($item_id)
	{
		$data= array();

		$this->form_validation->set_rules('price', 'lang:items_price', 'required|numeric');
		$this->form_validation->set_rules('quantity', 'lang:items_quantity', 'required|numeric');
		$this->form_validation->set_rules('discount', 'lang:items_discount', 'required|numeric');

    	$description = $this->input->post('description');
    	$serialnumber = $this->input->post('serialnumber');
		$price = $this->input->post('price');
		$quantity = $this->input->post('quantity');
		$discount = $this->input->post('discount');
		$item_location = $this->input->post('location');

		if ($this->form_validation->run() != FALSE)
		{
			$this->receiving_lib->edit_item($item_id, $description, $serialnumber, $quantity, $discount, $price);
		}
		else
		{
			$data['error']=$this->lang->line('recvs_error_editing_item');
		}

		$this->_reload($data);
	}
	
	function edit($receiving_id)
	{
		$data = array();
	
		$data['suppliers'] = array('' => 'No Supplier');
		foreach ($this->Supplier->get_all()->result() as $supplier)
		{
			$data['suppliers'][$supplier->person_id] = $supplier->first_name . ' ' . $supplier->last_name;
		}
	
		$data['employees'] = array();
		foreach ($this->Employee->get_all()->result() as $employee)
		{
			$data['employees'][$employee->person_id] = $employee->first_name . ' '. $employee->last_name;
		}
	
		$receiving_info = $this->Receiving->get_info($receiving_id)->row_array();
		$person_name = $receiving_info['first_name'] . " " . $receiving_info['last_name'];
		$data['selected_supplier_name'] = !empty($receiving_info['supplier_id']) ? $person_name : "";
		$data['selected_supplier_id'] = $receiving_info['supplier_id'];
		$data['receiving_info'] = $receiving_info;
	
		$this->load->view('receivings/form', $data);
	}

	function delete_item($item_number)
	{
		$this->receiving_lib->delete_item($item_number);
		$this->_reload();
	}
	
	function delete($receiving_id = -1, $update_inventory=TRUE) 
	{
		$employee_id=$this->Employee->get_logged_in_employee_info()->person_id;
		$receiving_ids=$receiving_id == -1 ? $this->input->post('ids') : array($receiving_id);
	
		if($this->Receiving->delete_list($receiving_ids, $employee_id, $update_inventory))
		{
			echo json_encode(array('success'=>true,'message'=>$this->lang->line('recvs_successfully_deleted').' '.
					count($receiving_ids).' '.$this->lang->line('recvs_one_or_multiple'),'ids'=>$receiving_ids));
		}
		else
		{
			echo json_encode(array('success'=>false,'message'=>$this->lang->line('recvs_cannot_be_deleted')));
		}
	}

	function delete_supplier()
	{
		$this->receiving_lib->clear_invoice_number();
		$this->receiving_lib->delete_supplier();
		$this->_reload();
	}

	function complete()
	{
		$data['cart']=$this->receiving_lib->get_cart();
		$data['total']=$this->receiving_lib->get_total();
		$data['receipt_title']=$this->lang->line('recvs_receipt');
		$data['transaction_time']= date($this->config->item('dateformat').' '.$this->config->item('timeformat'));
		$data['mode']=$this->receiving_lib->get_mode();
		$data['show_stock_locations']=$this->Stock_location->show_locations('receivings');
		$supplier_id=$this->receiving_lib->get_supplier();
		$employee_id=$this->Employee->get_logged_in_employee_info()->person_id;
		$comment = $this->input->post('comment');
		$emp_info=$this->Employee->get_info($employee_id);
		$payment_type=$this->input->post('payment_type');
        $data['stock_location']=$this->receiving_lib->get_stock_source();
		if ( $this->input->post('amount_tendered') != null )
		{
			$data['amount_tendered'] = $this->input->post('amount_tendered');
			$data['amount_change'] = to_currency($data['amount_tendered'] - $data['total']);
		}
		$data['employee']=$emp_info->first_name.' '.$emp_info->last_name;
		$suppl_info	='';
		if($supplier_id!=-1)
		{
			$suppl_info=$this->Supplier->get_info($supplier_id);
			$data['supplier']=$suppl_info->company_name;  //   first_name.' '.$suppl_info->last_name;
		}
		$invoice_number=$this->_substitute_invoice_number($suppl_info);
		if ($this->receiving_lib->is_invoice_number_enabled() && $this->Receiving->invoice_number_exists($invoice_number))
		{
			$data['error']=$this->lang->line('recvs_invoice_number_duplicate');
			$this->_reload($data);
		}
		else
		{
			$invoice_number = $this->receiving_lib->is_invoice_number_enabled() ? $invoice_number : null;
			$data['invoice_number']=$invoice_number;
			$data['payment_type']=$this->input->post('payment_type');
			//SAVE receiving to database
			$data['receiving_id']='RECV '.$this->Receiving->save($data['cart'], $supplier_id,$employee_id,$comment,$invoice_number,$payment_type,$data['stock_location']);
			
			if ($data['receiving_id'] == 'RECV -1')
			{
				$data['error_message'] = $this->lang->line('receivings_transaction_failed');
			}
			$data['barcode']=$this->barcode_lib->generate_receipt_barcode($data['receiving_id']);
			$data['print_after_sale'] = $this->receiving_lib->is_print_after_sale();
			$this->load->view("receivings/receipt",$data);
			$this->receiving_lib->clear_all();
		}
	}
	
	private function _substitute_variable($text, $variable, $object, $function)
	{
		// don't query if this variable isn't used
		if (strstr($text, $variable))
		{
			$value = call_user_func(array($object, $function));
			$text = str_replace($variable, $value, $text);
		}
		return $text;
	}
	
	private function _substitute_variables($text,$supplier_info)
	{
		$text=$this->_substitute_variable($text, '$YCO', $this->Receiving, 'get_invoice_number_for_year');
		$text=$this->_substitute_variable($text, '$CO', $this->Receiving , 'get_invoice_count');
		$text=strftime($text);
		$text=$this->_substitute_supplier($text, $supplier_info);
		return $text;
	}

	private function _substitute_supplier($text,$supplier_info)
	{
		$supplier_id=$this->receiving_lib->get_supplier();
		if($supplier_id!=-1)
		{
			$text=str_replace('$SU',$supplier_info->company_name,$text);
			$words = preg_split("/\s+/", trim($supplier_info->company_name));
			$acronym = "";
			foreach ($words as $w) {
				$acronym .= $w[0];
			}
			$text=str_replace('$SI',$acronym,$text);
		}
		return $text;
	}
	
	private function _substitute_invoice_number($supplier_info='')
	{
		$invoice_number=$this->receiving_lib->get_invoice_number();
		$invoice_number=$this->config->config['recv_invoice_format'];
		$invoice_number = $this->_substitute_variables($invoice_number,$supplier_info);
		$this->receiving_lib->set_invoice_number($invoice_number);
		return $this->receiving_lib->get_invoice_number();
	}

    function requisition_complete()
    {
    	if ($this->receiving_lib->get_stock_source() != $this->receiving_lib->get_stock_destination()) 
    	{
    		foreach($this->receiving_lib->get_cart() as $item)
    		{
    			$this->receiving_lib->delete_item($item['line']);
    			$this->receiving_lib->add_item($item['item_id'],$item['quantity'],$this->receiving_lib->get_stock_destination());
    			$this->receiving_lib->add_item($item['item_id'],-$item['quantity'],$this->receiving_lib->get_stock_source());
    		}
    		
			$this->complete();
    	}
    	else 
    	{
    		$data['error']=$this->lang->line('recvs_error_requisition');
    		$this->_reload($data);	
    	}
    }
    
	function receipt($receiving_id)
	{
		$receiving_info = $this->Receiving->get_info($receiving_id)->row_array();
		$this->receiving_lib->copy_entire_receiving($receiving_id);
		$data['cart']=$this->receiving_lib->get_cart();
		$data['total']=$this->receiving_lib->get_total();
		$data['mode']=$this->receiving_lib->get_mode();
		$data['receipt_title']=$this->lang->line('recvs_receipt');
		$data['transaction_time']= date($this->config->item('dateformat').' '.$this->config->item('timeformat'), strtotime($receiving_info['receiving_time']));
		$data['show_stock_locations']=$this->Stock_location->show_locations('receivings');
		$supplier_id=$this->receiving_lib->get_supplier();
		$emp_info=$this->Employee->get_info($receiving_info['employee_id']);
		$data['payment_type']=$receiving_info['payment_type'];
		$data['invoice_number']=$this->receiving_lib->get_invoice_number();
		$data['receiving_id']='RECV '.$receiving_id;
		$data['barcode']=$this->barcode_lib->generate_receipt_barcode($data['receiving_id']);
		$data['employee']=$emp_info->first_name.' '.$emp_info->last_name;

		if($supplier_id!=-1)
		{
			$supplier_info=$this->Supplier->get_info($supplier_id);
			$data['supplier']=$supplier_info->first_name.' '.$supplier_info->last_name;
		}
		$data['print_after_sale'] = FALSE;
		$this->load->view("receivings/receipt",$data);
		$this->receiving_lib->clear_all();
	}

	private function _reload($data=array())
	{
		$person_info = $this->Employee->get_logged_in_employee_info();
		$data['cart']=$this->receiving_lib->get_cart();
		$data['modes']=array('receive'=>$this->lang->line('recvs_receiving'),'return'=>$this->lang->line('recvs_return'));
		$data['mode']=$this->receiving_lib->get_mode();

		$data['stock_locations']=$this->Stock_location->get_allowed_locations('receivings');
		$show_stock_locations = count($data['stock_locations']) > 1;
        if ($show_stock_locations) 
        {
        	$data['modes']['requisition']=$this->lang->line('recvs_requisition');
	        $data['stock_source']=$this->receiving_lib->get_stock_source();
        	$data['stock_destination']=$this->receiving_lib->get_stock_destination();
        }    
        $data['show_stock_locations']=$show_stock_locations;
        
		$data['total']=$this->receiving_lib->get_total();
		$data['items_module_allowed']=$this->Employee->has_grant('items',$person_info->person_id);
		$data['comment']=$this->receiving_lib->get_comment();
		$data['payment_options']=array(
			$this->lang->line('sales_cash') => $this->lang->line('sales_cash'),
			$this->lang->line('sales_check') => $this->lang->line('sales_check'),
			$this->lang->line('sales_debit') => $this->lang->line('sales_debit'),
			$this->lang->line('sales_credit') => $this->lang->line('sales_credit')
		);
		
		$supplier_id=$this->receiving_lib->get_supplier();
		$suppl_info='';
		if($supplier_id!=-1)
		{
			$suppl_info=$this->Supplier->get_info($supplier_id);
			$data['supplier']=$suppl_info->company_name;  // first_name.' '.$info->last_name;
		}
		$data['invoice_number']=$this->_substitute_invoice_number($suppl_info);
		$data['invoice_number_enabled']=$this->receiving_lib->is_invoice_number_enabled();
		$data['print_after_sale']=$this->receiving_lib->is_print_after_sale();
		$this->load->view("receivings/receiving",$data);
	}
	
	function save($receiving_id)
	{
		$date_formatter = date_create_from_format($this->config->item('dateformat') . ' ' . $this->config->item('timeformat'), $this->input->post('date', TRUE));

		$receiving_data = array(
			'receiving_time' => $date_formatter->format('Y-m-d H:i:s'),
			'supplier_id' => $this->input->post('supplier_id', TRUE) ? $this->input->post('supplier_id') : null,
			'employee_id' => $this->input->post('employee_id'),
			'comment' => $this->input->post('comment'),
			'invoice_number' => $this->input->post('invoice_number')
		);
	
		if ($this->Receiving->update($receiving_data, $receiving_id))
		{
			echo json_encode(array(
				'success'=>true,
				'message'=>$this->lang->line('recvs_successfully_updated'),
				'id'=>$receiving_id)
			);
		}
		else
		{
			echo json_encode(array(
				'success'=>false,
				'message'=>$this->lang->line('recvs_unsuccessfully_updated'),
				'id'=>$receiving_id)
			);
		}
	}

    function cancel_receiving()
    {
    	$this->receiving_lib->clear_all();
    	$this->_reload();
    }
    
    function check_invoice_number()
    {
		$receiving_id=$this->input->post('receiving_id');
		$invoice_number=$this->input->post('invoice_number');
		$exists=!empty($invoice_number) && $this->Receiving->invoice_number_exists($invoice_number, $receiving_id);
		echo !$exists ? 'true' : 'false';
    }
}
?>

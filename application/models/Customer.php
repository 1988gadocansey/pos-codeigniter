<?php
class Customer extends Person
{	
	/*
	Determines if a given person_id is a customer
	*/
	function exists($person_id)
	{
		$this->db->from('customers');	
		$this->db->join('people', 'people.person_id = customers.person_id');
		$this->db->where('customers.person_id', $person_id);
		$query = $this->db->get();
		
		return ($query->num_rows()==1);
	}
	function getCustomerName($person_id){
        $this->db->from('people');
        $this->db->where('person_id', $person_id);

        $query=$this->db->get();

        $data=$query->row();


		return $data->first_name." ".$data->last_name;

	}
	function billCustomer($customer,$amount){
		$data=array(
			'owing'=>$amount
		);
        $this->db->where('person_id', $customer);
        $this->db->set("owing","owing + $amount",false);

        $this->db->update('customers');
	}
	
	function account_number_exists($account_number,$person_id='')
	{
		$this->db->from('customers');
		$this->db->where('account_number', $account_number);
		if (!empty($person_id))
		{
			$this->db->where('person_id !=', $person_id);
		}
		$query=$this->db->get();

		return ($query->num_rows()==1);
	}	
	
	function get_total_rows()
	{
		$this->db->from('customers');
		$this->db->where('deleted', 0);

		return $this->db->count_all_results();
	}
	
	/*
	Returns all the customers
	*/
	function get_all($rows = 0, $limit_from = 0)
		{
		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');			
		$this->db->where('deleted', 0);
		$this->db->order_by("last_name", "asc");
		if ($rows > 0)
		{
			$this->db->limit($rows, $limit_from);
		}

		return $this->db->get();		
	}
	
	/*
	Gets information about a particular customer
	*/
	function get_info($customer_id)
	{
		$this->db->from('customers');
		$this->db->join('people', 'people.person_id = customers.person_id');
		$this->db->where('customers.person_id', $customer_id);
		$query = $this->db->get();
		
		if($query->num_rows() == 1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $customer_id is NOT a customer
			$person_obj=parent::get_info(-1);
			
			//Get all the fields from customer table
			$fields = $this->db->list_fields('customers');
			
			//append those fields to base parent object, we we have a complete empty object
			foreach ($fields as $field)
			{
				$person_obj->$field='';
			}
			
			return $person_obj;
		}
	}
	
	/*
	Gets total about a particular customer
	*/
	function get_totals($customer_id)
	{
		$this->db->select('sum(payment_amount) as total', false);
		$this->db->from('sales');
		$this->db->join('sales_payments', 'sales.sale_id = sales_payments.sale_id');
		$this->db->where('sales.customer_id', $customer_id);

		return $this->db->get()->row();
	}
	
	/*
	Gets information about multiple customers
	*/
	function get_multiple_info($customer_ids)
	{
		$this->db->from('customers');
		$this->db->join('people', 'people.person_id = customers.person_id');		
		$this->db->where_in('customers.person_id', $customer_ids);
		$this->db->order_by("last_name", "asc");

		return $this->db->get();
	}
	
	/*
	Inserts or updates a customer
	*/
	function save_customer(&$person_data, &$customer_data, $customer_id=false)
	{
		$success=false;
		//Run these queries as a transaction, we want to make sure we do all or nothing
		$this->db->trans_start();
		
		if(parent::save($person_data, $customer_id))
		{
			if (!$customer_id or !$this->exists($customer_id))
			{
				$customer_data['person_id'] = $person_data['person_id'];
				$success = $this->db->insert('customers', $customer_data);				
			}
			else
			{
				$this->db->where('person_id', $customer_id);
				$success = $this->db->update('customers', $customer_data);
			}
		}
		
		$this->db->trans_complete();
		
		return $success;
	}
	
	/*
	Deletes one customer
	*/
	function delete($customer_id)
	{
		$this->db->where('person_id', $customer_id);

		return $this->db->update('customers', array('deleted' => 1));
	}
	
	/*
	Deletes a list of customers
	*/
	function delete_list($customer_ids)
	{
		$this->db->where_in('person_id', $customer_ids);

		return $this->db->update('customers', array('deleted' => 1));
 	}
 	
 	/*
	Get search suggestions to find customers
	*/
	function get_search_suggestions($search, $unique=TRUE, $limit=25)
	{
		$suggestions = array();
		
		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');	
		$this->db->where("(first_name LIKE '%".$this->db->escape_like_str($search)."%' or 
			last_name LIKE '%".$this->db->escape_like_str($search)."%' or 
			CONCAT(`first_name`,' ',`last_name`) LIKE '%".$this->db->escape_like_str($search)."%') and 
			deleted = 0");
		$this->db->order_by("last_name", "asc");		
		$by_name = $this->db->get();
		foreach($by_name->result() as $row)
		{
			$suggestions[]=array('value' => $row->person_id, 'label' => $row->first_name.' '.$row->last_name);
		}

		if (!$unique)
		{
			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id=people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like("email", $search);
			$this->db->order_by("email", "asc");
			$by_email = $this->db->get();
			foreach($by_email->result() as $row)
			{
				$suggestions[]=array('value' => $row->person_id, 'label' => $row->email);
			}

			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id = people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like("phone_number", $search);
			$this->db->order_by("phone_number", "asc");
			$by_phone = $this->db->get();
			foreach($by_phone->result() as $row)
			{
				$suggestions[]=array('value' => $row->person_id, 'label' => $row->phone_number);
			}

			$this->db->from('customers');
			$this->db->join('people', 'customers.person_id = people.person_id');
			$this->db->where('deleted', 0);
			$this->db->like("account_number", $search);
			$this->db->order_by("account_number", "asc");
			$by_account_number = $this->db->get();
			foreach($by_account_number->result() as $row)
			{
				$suggestions[]=	array('value' => $row->person_id, 'label' => $row->account_number);
			}
		}
		
		//only return $limit suggestions
		if(count($suggestions > $limit))
		{
			$suggestions = array_slice($suggestions, 0,$limit);
		}

		return $suggestions;
	}

	function get_found_rows($search)
	{
		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');
		$this->db->where("(first_name LIKE '%".$this->db->escape_like_str($search)."%' or
			last_name LIKE '%".$this->db->escape_like_str($search)."%' or
			email LIKE '%".$this->db->escape_like_str($search)."%' or
			phone_number LIKE '%".$this->db->escape_like_str($search)."%' or
			account_number LIKE '%".$this->db->escape_like_str($search)."%' or
			CONCAT(`first_name`,' ',`last_name`) LIKE '%".$this->db->escape_like_str($search)."%') and 
			deleted = 0");

		return $this->db->get()->num_rows();
	}
	
	/*
	Perform a search on customers
	*/
	function search($search, $rows = 0, $limit_from = 0, $sort = 'last_name', $order = 'asc')
	{
		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');		
		$this->db->where("(first_name LIKE '%".$this->db->escape_like_str($search)."%' or 
			last_name LIKE '%".$this->db->escape_like_str($search)."%' or 
			email LIKE '%".$this->db->escape_like_str($search)."%' or 
			phone_number LIKE '%".$this->db->escape_like_str($search)."%' or 
			account_number LIKE '%".$this->db->escape_like_str($search)."%' or 
			CONCAT(`first_name`,' ',`last_name`) LIKE '%".$this->db->escape_like_str($search)."%') and 
			deleted = 0");		
		$this->db->order_by($sort, $order);
		if ($rows > 0)
		{
			$this->db->limit($rows, $limit_from);
		}

		return $this->db->get();	
	}
}
?>

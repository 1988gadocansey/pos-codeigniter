<?php
class Bill extends CI_Model
{
    /*
    Determines if a given person_id is a customer
    */
    function get_all($rows = 0, $limit_from = 0)
    {
        $this->db->from('credit_transactions');
        $this->db->where('deleted', 0);
        $this->db->order_by("amount_tendered", "asc");

        if ($rows > 0)
        {
            $this->db->limit($rows, $limit_from);
        }

        $row= $this->db->get();
        return $row->result();
    }
    function getCustomerCreditDetail($person_id){
        $this->db->from('credit_transactions');
        $this->db->where('id', $person_id);


        $query=$this->db->get();

        $data=$query->row();


        return $data;

    }
    function deleteCustomerBill($id)
    {
        // first lets settled the bill
        $creditSalesData=$this->getCustomerCreditDetail($id);
       // die( $creditSalesData);
        $amount=$creditSalesData->amount_tendered;
        $sales_id=$creditSalesData->sales_id;
        $this->db->where('sale_id', $sales_id);

        $this->db->update('sales_payments', array('payment_amount' => $amount));

        // mark the credit sales as nullified
        $this->db->where('id', $id);

        return $this->db->update('credit_transactions', array('deleted' => 1));

    }
}
?>

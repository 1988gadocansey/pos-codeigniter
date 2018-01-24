<?php
require_once ("Secure_area.php");

class Bills extends Secure_area
{
    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        $data['data']= $this->Bill->get_all();
        $this->load->view('bills/index', $data);




    }
    function delete(){
        $customers_to_delete=$this->input->get('id');

        if($this->Bill->deleteCustomerBill($customers_to_delete))
        {
            redirect($_SERVER['HTTP_REFERER']);
        }
        else
        {
            redirect($_SERVER['HTTP_REFERER']);
        }
    }



}
?>
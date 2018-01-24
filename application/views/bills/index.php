<?php $this->load->view("partial/header"); ?>






<div id="table_holder">
    <table id="table" class="table-responsive table tablesorter table-strip">
        <thead>
        <th>No</th>
        <th>Customer name</th>
        <th>Credit Sales</th>
        <th>Date</th>
        <th>Action</th>
        </thead>
        <tbody>
            <?php
            //die($data);
                foreach ($data as $row){

                    ?>
                <tr>
                    <td><?php echo $row->id?></td>
                    <td><?php echo $row->customer_name?></td>
                    <td><?php echo $row->amount_tendered?></td>
                    <td><?php echo $row->date?></td>
                    <td><a href="bills/delete?id=<?php echo $row->id?>"  onclick="return confirm('this will delete customer')">Delete</a></td>
                </tr>
            <?php

                }
            ?>

        </tbody>
    </table>
</div>

<?php $this->load->view("partial/footer"); ?>

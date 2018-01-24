<?php
 
class Sms
{
	/*
	 * SMS send function
	 * Example of use: $response = sendSMS('myUsername', 'myPassword', '4477777777', 'My test message', 'My company');
	 */
	function sendSMS($username, $password, $phone, $message, $originator)
	{
		$response = FALSE;
		
		// if any of the parameters is empty return with a FALSE
		if( empty($phone) || empty($message) )
		{
			//echo $username . ' ' . $password . ' ' . $phone . ' ' . $message . ' ' . $originator;
		}
		else
		{
			$response = TRUE;
			
			$phone="+233".\substr($phone,1,9);
            $url = 'http://txtconnect.co/api/send/'; 
            $fields = array( 
            'token' => \urlencode('a166902c2f552bfd59de3914bd9864088cd7ac77'), 
            'msg' => \urlencode($message), 
            'from' => \urlencode("Westreck"), 
            'to' => \urlencode($phone), 
            );
            $fields_string = "";
            foreach ($fields as $key => $value) {
                $fields_string .= $key . '=' . $value . '&';
            }
            \rtrim($fields_string, '&');
            $ch = \curl_init();
            \curl_setopt($ch, \CURLOPT_URL, $url);
            \curl_setopt($ch, \CURLOPT_RETURNTRANSFER, true);
            \curl_setopt($ch, \CURLOPT_FOLLOWLOCATION, true);
            \curl_setopt($ch, \CURLOPT_POST, count($fields));
            \curl_setopt($ch, \CURLOPT_POSTFIELDS, $fields_string);
            \curl_setopt($ch, \CURLOPT_SSL_VERIFYPEER, 0);
            $result = \curl_exec($ch);
            \curl_close($ch);
            $data = \json_decode($result);
            if ($data->error == "0") {
                $year = date("Y");
                $info = "Message was successfully sent";
                $date = time();

                return $info;
            } else {

                $info = "Message failed to send. Error: " . $data->error;
                return $info;
            }
        }

		return $response;
	}
}

?>

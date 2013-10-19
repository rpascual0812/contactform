<?php
require_once('../../Classes/Contacts.php');

//decode the data first because
//ContactsFactory create method is passing a JSON.stringified object
$data = json_decode($_POST['data']);

$class = new Contacts(
					$data->firstname,
					$data->lastname,
					$data->address,
					$data->city,
					$data->state,
					$data->zip
				);

$data = $class->create();

header("HTTP/1.0 500 Internal Server Error");
if($data['status']==true){
	header("HTTP/1.0 200 OK");
}

header('Content-Type: application/json');
print(json_encode($data));
?>
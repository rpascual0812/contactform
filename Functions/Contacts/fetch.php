<?php
require_once('../../Classes/Contacts.php');

$class = new Contacts(
					NULL,
					NULL,
					NULL,
					NULL,
					NULL,
					NULL
				);

$data = $class->fetch();

header("HTTP/1.0 404 No contacts found");
if($data['status']==true){
	header("HTTP/1.0 200 OK");
}

header('Content-Type: application/json');
print(json_encode($data));
?>
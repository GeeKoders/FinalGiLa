<?php
		$name = isset($_POST['email'])   ? $_POST['email']    : '' ;
	$password = isset($_POST['password'])? $_POST['password'] : '' ;
//	if ($name =='test@gmail.com')
//		echo 'email: '.$name.'<br/>'.'pw: '.$password;
	
//$login =<<<HEREDOC
//	{ "ID" : $name, "PW" : $password } ;
//HEREDOC;

	$login = Array (
		"ID" => $name,
		"PW" => $password
	);

	echo json_encode( $login );
?>

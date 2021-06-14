<?php
	require_once('config.php');
	header('Content-Type: application/json; charset=utf-8');
		$conn= config::connect();
		
		$request_body= file_get_contents("php://input");
	
		$new_item=json_decode($request_body,true);

		
		$query = $conn->prepare("SELECT program_name FROM program WHERE programID IN
						( SELECT program_id FROM college_program WHERE college_id = :college_id ) ");
		$query->bindparam(":college_id",$new_item['college_id']);
		$query->execute();
		$results=[];
		
		foreach($query as $row){
			$results[]=['name'=>$row['program_name']];
		}
		echo json_encode($results);
?>

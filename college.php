<?php
	require_once('config.php');
	header('Content-Type: application/json; charset=utf-8');
		$conn= config::connect();
	
		$query = "SELECT * FROM college";
		$stmt = $conn->query($query);
		foreach($stmt as $row){
			$results[]=
				['name'=>$row['college_name'],
				'id'=>$row['college_id']                   
				];
		}
		echo json_encode($results);
?>
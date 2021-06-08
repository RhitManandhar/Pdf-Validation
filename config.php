<?php
	class config{
	public static function connect(){
		$host="localhost";
		$username="root";
		$password="";
		$dbName="course";
		
		try{
			$conn=new PDO("mysql:host=$host;dbname=$dbName",$username,$password);
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
		}catch(PDOException $e){
			echo "Connection failed".$e->getMessage();
		}
		return $conn;
		}
	}
?>
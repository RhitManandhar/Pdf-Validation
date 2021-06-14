<?php

	include('PdfToText.phpclass');
	require_once('config.php');
	//header('Content-Type: application/json; charset=utf-8');
	$target_dir = "uploads/";
	$target_file = $target_dir.basename($_FILES["filename"]["name"]);
	$filename= basename($_FILES["filename"]["name"]);
	
	if (move_uploaded_file($_FILES["filename"]["tmp_name"],$target_file)){
		
		// courses from database
		$conn= config::connect();
	
		$query = "SELECT * FROM course";
		$stmt = $conn->query($query);
		$results=[];
		
		foreach($stmt as $row){
			$results[$row['course_name']]=[
				"week1" => $row['week1'],
				"week2" => $row['week2'],
				"week3" => $row['week3'],
				"week4" => $row['week4'],
				"week5" => $row['week5'],
				"week6" => $row['week6'],
				"week7" => $row['week7'],
				"week8" => $row['week8'],
				"week9" => $row['week9'],
				"week10" => $row['week10'],
				"week11" => $row['week11'],
				"week12" => $row['week12']
			];
		}
		
		$query1=$conn->prepare("INSERT INTO student(
									student_name,
									student_email,
									student_college,
									student_program,
									student_File
								)
								VALUES(:student_name,:student_email,:student_college,:student_program,:student_File)");
			$query1->bindparam(":student_name",$_POST['name']);
			$query1->bindparam(":student_email",$_POST['email']);
			$query1->bindparam(":student_college",$_POST['college']);
			$query1->bindparam(":student_program",$_POST['program']);
			$query1->bindparam(":student_File",$filename);
			$query1->execute();

		
		//echo json_encode($results,JSON_PRETTY_PRINT);	

			//pdf to textcontent
		
		$pdf = new PdfToText('uploads/'.basename($_FILES['filename']['name']));
	
		$rawContent = $pdf -> Text;
		$pattern = '/Course[1-23]:/';
		
		$num_of_course = preg_match_all($pattern,$rawContent);
		$course=[];
		
		// storing textcontent to array
		for($i=1;$i<=$num_of_course;$i++){
			
			$offset = strpos($rawContent,'Course'.$i.':');
			
			preg_match('/Course'.$i.':\s(.*?)\s+Week1/',$rawContent,$coursename,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week1:\s(.*?)\s+Week2/',$rawContent,$week1,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week2:\s(.*?)\s+Week3/',$rawContent,$week2,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week3:\s(.*?)\s+Week4/',$rawContent,$week3,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week4:\s(.*?)\s+Week5/',$rawContent,$week4,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week5:\s(.*?)\s+Week6/',$rawContent,$week5,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week6:\s(.*?)\s+Week7/',$rawContent,$week6,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week7:\s(.*?)\s+Week8/',$rawContent,$week7,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week8:\s(.*?)\s+Week9/',$rawContent,$week8,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week9:\s(.*?)\s+Week10/',$rawContent,$week9,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week10:\s(.*?)\s+Week11/',$rawContent,$week10,PREG_OFFSET_CAPTURE,$offset);
			preg_match('/Week11:\s(.*?)\s+Week12/',$rawContent,$week11,PREG_OFFSET_CAPTURE,$offset);
			
			if($i+1<=$num_of_course){
				preg_match('/Week12:\s(.*?)\s+Course/',$rawContent,$week12,PREG_OFFSET_CAPTURE,$offset);
			}
			else{
				preg_match('/Week12:\s(.*)\s/',$rawContent,$week12,PREG_OFFSET_CAPTURE,$offset);
			
			}
			
			$course[$coursename[1][0]]=[
				"Week1" =>$week1[1][0],
				"Week2" =>$week2[1][0],
				"Week3" =>$week3[1][0],
				"Week4" =>$week4[1][0],
				"Week5" =>$week5[1][0],
				"Week6" =>$week6[1][0],
				"Week7" =>$week7[1][0],
				"Week8" =>$week8[1][0],
				"Week9" =>$week9[1][0],
				"Week10" =>$week10[1][0],
				"Week11" =>$week11[1][0],
				"Week12" =>$week12[1][0]
			];
			
		}
		//echo json_encode($course,JSON_PRETTY_PRINT);
		
	echo intval(diff($results,$course)).'% matched';
	echo '<br><a href="index.html">Go back</a>';
		
		
	}
	else{
		echo json_encode ("Problem uploading file");
	}
	
	// finding out difference
	function diff($arr1,$arr2){
		$counter=0;
		$total=0;
		foreach($arr1 as $index1=>$i1){
			foreach($arr2 as $index2=>$i2){
				if ($index1==$index2){
					foreach($i1 as $key1=>$value1){
						foreach($i2 as $key2=>$value2){
							if ($value1==$value2){
								$counter++;
							}
						}
						$total++;
					}
				}
			}
		}
		return ($counter/$total)*100;
	}
?>
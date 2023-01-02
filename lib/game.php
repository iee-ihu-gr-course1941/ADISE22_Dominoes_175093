<?php

function show_status() {
	global $mysqli;
	
	 $sql= 'select * from game_status';
     $st = $mysqli->prepare($sql);

     $st -> execute();
     $res = $st ->get_result();
 
		 
	 
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
 
}

function show_player1() {
	global $mysqli;
	
	 $sql= 'select * from player1';
     $st = $mysqli->prepare($sql);

     $st -> execute();
     $res = $st ->get_result();
 
		 
	 
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
 
}

function show_player2() {
	global $mysqli;
	
	 $sql= 'select * from player2';
     $st = $mysqli->prepare($sql);

     $st -> execute();
     $res = $st ->get_result();
 
		 
	 
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
 
}




?>
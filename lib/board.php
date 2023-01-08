<?php

function show_piece($x,$y) {
	global $mysqli;
	
	$sql = 'select * from board where x=? ';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$x );
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}


/*function show_board($input) {
	global $mysqli;
	
	$b=current_color($input['token']);
	if($b) {
		show_board_by_player($b);
	} else {
		header('Content-type: application/json');
		print json_encode(read_board(), JSON_PRETTY_PRINT);
	}
}

*/


function show_board() {
	global $mysqli;
	
	 $sql= 'select * from board';
     $st = $mysqli->prepare($sql);

     $st -> execute();
     $res = $st ->get_result();
 
		 
	 
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
 
}




function reset_board() {
	global $mysqli;
	$sql = 'call clean_board()';
	$mysqli->query($sql);
    show_board();
}




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
	
	 $sql= 'select * from piecesp1';
     $st = $mysqli->prepare($sql);

     $st -> execute();
     $res = $st ->get_result();
 
		 
	 
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
 
}

function show_player2() {
	global $mysqli;
	
	 $sql= 'select * from piecesp2';
     $st = $mysqli->prepare($sql);

     $st -> execute();
     $res = $st ->get_result();
 
		 
	 
		header('Content-type: application/json');
		print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
 
}
 






   
function move_piece($x,$y,$x2,$y2,$token) {
	

 


	if($token==null || $token=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"token is not set."]);
		exit;
	}
	
	$turn = current_seat($token);
	if($turn==null ) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"You are not a player of this game."]);
		exit;
	}


	$status = read_status();
	if($status['status']!='started') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Game is not in action."]);
		exit;
	}



	 if($status['seat_turn']!=$turn) {
	 	header("HTTP/1.1 400 Bad Request");
	  	print json_encode(['errormesg'=>"It is not your turn."]);
	  	exit;
	 }





	 global $mysqli;
	 global $change;
	 
	 

	 $sql = 'select count(*) as actinb from board where piece is not null';
	 $st = $mysqli->prepare($sql);
	 $st->execute();
	 $res = $st->get_result();
	 $piecesonboard = $res->fetch_assoc()['actinb'];

	 $sql = 'select max(x) as maxin from board where piece is not null';
	 $st = $mysqli->prepare($sql);
	 $st->execute();
	 $res = $st->get_result();
	 $maxi = $res->fetch_assoc()['maxin'];
 

	 $sql = 'select min(x) as minin from board where piece is not null';
	 $st = $mysqli->prepare($sql);
	 $st->execute();
	 $res = $st->get_result();
	 $mini = $res->fetch_assoc()['minin'];

	 
	

	 

	 if($y==1 or $y==-1 ){




	 if($piecesonboard==0) 
	 {
		$y=14;
		do_move($x,$y,$x2,$y2);
		exit;
	 }
	

    if($piecesonboard>0)
	{
		

		
			if ($y==-1)
			{
				

				$y=$mini-1;
				$change = $mini;

				$sql = 'select piece as pie from board where x=?';
				$st = $mysqli->prepare($sql);
				$st->bind_param('i', $mini);
				$st->execute();
				 $result = $st->get_result();
				 $pieceforcut = $result->fetch_assoc()['pie'];
				 	
				 $firstn = substr($pieceforcut,0,1);
				 $thirdn = substr($pieceforcut,2,1);

					 if ($firstn==$x2)
					 {

					 	do_move($x,$y,$y2,$x2);
					 	exit;
					 } 
					 elseif($firstn==$y2)
					 {

						do_move($x,$y,$x2,$y2);
						exit;
					 }
	   

			}
			elseif ($y==1)
			{
				$y=$maxi+1;
				$change = $maxi;
				
				$sql = 'select piece as pie from board where x=?';
				$st = $mysqli->prepare($sql);
				$st->bind_param('i', $maxi);
				$st->execute();
				 $result = $st->get_result();
				 $pieceforcut = $result->fetch_assoc()['pie'];
				 	
				 $firstn = substr($pieceforcut,0,1);
				 $thirdn = substr($pieceforcut,2,1);

					 if ($thirdn==$x2)
					 {

					 	do_move($x,$y,$x2,$y2);
					 	exit;
					 } 
					 elseif($thirdn==$y2)
					 {

						do_move($x,$y,$y2,$x2);
						exit;
					 }
	   
	   



			}


	}

	


} 
else 
{
	header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"you can type only (-1) for (left) and  (1) for (right) in second place"]);
 exit;
}
	 




	
}


function do_move($x,$y,$x2,$y2) {
	global $mysqli;
	$sql = 'call `move_piece`(?,?,?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('iiii',$x,$y,$x2,$y2 );
	$st->execute();

	 show_board();
}




function read_board() {
	global $mysqli;
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}






?>
<?php

 

function read_status() {
	global $mysqli;
	
	$sql = 'select * from game_status';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();
	$status = $res->fetch_assoc();
	return($status);
}





 function update_game_status() {
	global $mysqli;
	
	$sql = 'select * from game_status';
	$st = $mysqli ->prepare($sql);
    $st -> execute();
    $res = $st->get_result();
    $status = $res->fetch_assoc();
	
	$new_status=null;
	$new_turn=null;
	
 
	 


   

	$sql = 'select count(*) as c from players where username is not null';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$active_players = $res->fetch_assoc()['c'];
	
	
	switch($active_players) {
		case 0: $new_status='not active'; break;
		case 1: $new_status='initialized'; break;
		case 2: $new_status='started'; 
				if($status['seat_turn']==null) {
					$new_turn=rand(1,2); // It was not started before...
				}
				break;
	}

	
	
	if ($active_players==2 ) 
	
	{
		$sql = 'call fill_random_pieces()';
		$mysqli->query($sql);
	 
	}


	$sql = 'update game_status set status=?, seat_turn=? ';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$new_status,$new_turn );
	$st->execute();

}
 


function reset_status() 
{
   
    $new_status="not active";
	$new_turn=null;

    global $mysqli;
    $sql = 'update game_status set status=?, seat_turn=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$new_status,$new_turn);
	$st->execute();

}











function update_game_status2() {
	global $mysqli;
	
	$sql = 'select * from game_status';
	$st = $mysqli ->prepare($sql);
    $st -> execute();
    $res = $st->get_result();
    $status = $res->fetch_assoc();
	
 
	$new_turn=null;
	

	 
	 
	$st3=$mysqli->prepare('select count(*) as ab from players WHERE last_action< (NOW() - INTERVAL 5 MINUTE)');
	$st3->execute();
	$res3 = $st3->get_result();
	$aborded = $res3->fetch_assoc()['ab'];
	if($aborded>0) {
		$sql = 'UPDATE players SET username=NULL, token=NULL WHERE last_action< (NOW() - INTERVAL 5 MINUTE)';
		$st2 = $mysqli->prepare($sql);
		$st2->execute();
		 

		$new_status='aborded';
    $sql = 'update game_status set status=?, seat_turn=? ';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$new_status,$new_turn );
	$st->execute();



	}
	

	$sql = 'select count(*) as endin from piecesp1 where piece is not null';
	$st4 = $mysqli->prepare($sql);
	$st4->execute();
	$res4 = $st4->get_result();
	$ending1 = $res4->fetch_assoc()['endin'];



	 if ($ending1==0) 
	 {
		if($status['status']=='started') 
		{
			$win = 'A';


			$new_status='ended';
			$sql = 'update game_status set status=?, seat_turn=?, result=? ';
			$st = $mysqli->prepare($sql);
			$st->bind_param('sss',$new_status,$new_turn,$win );
			$st->execute();




		}

	 }

	 $sql = 'select count(*) as endin2 from piecesp2 where piece is not null';
	 $st6 = $mysqli->prepare($sql);
	 $st6->execute();
	 $res = $st6->get_result();
	 $ending2 = $res->fetch_assoc()['endin2'];


	 if ($ending2==0) 
	 {
		if($status['status']=='started') {
			$win = 'B';


			$new_status='ended';
			$sql = 'update game_status set status=?, seat_turn=?, result=? ';
			$st = $mysqli->prepare($sql);
			$st->bind_param('sss',$new_status,$new_turn,$win );
			$st->execute();



		}

	 }



}
 






function extra_piece()
{
		global $mysqli;
		$sql = 'call take_piece2()';
		$mysqli->query($sql);
		show_board();

	}
	












 














?>
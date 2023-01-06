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
	
	// $st3=$mysqli->prepare('select count(*) as aborted from players WHERE last_action< (NOW() - INTERVAL 5 MINUTE)');
	// $st3->execute();
	// $res3 = $st3->get_result();
	// $aborted = $res3->fetch_assoc()['aborted'];
	// if($aborted>0) {
	// 	$sql = "UPDATE players SET username=NULL, token=NULL WHERE last_action< (NOW() - INTERVAL 5 MINUTE)";
	// 	$st2 = $mysqli->prepare($sql);
	// 	$st2->execute();
	// 	if($status['status']=='started') {
	// 		$new_status='aborted';
	// 	}
	// }

	
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


	$sql = 'update game_status set status=?, seat_turn=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$new_status,$new_turn);
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



 














?>
<?php


require_once "../lib/board.php";
require_once "../lib/dbconnect.php";
require_once "../lib/game.php";
require_once "../lib/users.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
// $request = explode('/', trim($_SERVER['SCRIPT_NAME'],'/'));
// Σε περίπτωση που τρέχουμε php –S
$input = json_decode(file_get_contents('php://input'),true);

 
if($input==null) {
    $input=[];
}
if(isset($_SERVER['HTTP_X_TOKEN'])) {
    $input['token']=$_SERVER['HTTP_X_TOKEN'];
} else {
    $input['token']='';
}

  
 
 switch ($r=array_shift($request))  {
case 'board' :   
switch ($b=array_shift($request)) {
            case '':
            case null: handle_board($method);break;
            case 'piece': handle_piece($method, $request[0],$request[1],$input);
            break;
          
            default: header("HTTP/1.1 404 Not Found");
            break;
            }

        break;

        case 'status': 
			if(sizeof($request)==0) {handle_status($method);}
			else {header("HTTP/1.1 404 Not Found");}
			break;

     case 'update': 
        if(sizeof($request)==0) {updated($method);}
        else {header("HTTP/1.1 404 Not Found");}
        break;
    
        case 'player1': 
            if(sizeof($request)==0) {handle_player1($method);}
                else {header("HTTP/1.1 404 Not Found");}
                break;       
        case 'player2': 
            if(sizeof($request)==0) {handle_player2($method);}
            else {header("HTTP/1.1 404 Not Found");}
          
            break;
        case 'takepiece': 
                if(sizeof($request)==0) {take_piece2($method);}
                else {header("HTTP/1.1 404 Not Found");}
              
                break;
         case 'players_info': handle_players_info($method, $request,$input);
         break;
        
        case 'reset':handle_reset($method);
        break;

        default:
            header("HTTP/1.1 404 Not Found");
            exit;
            
}




function handle_piece($method, $x,$y,$input) {
    if($method=='GET') {
        show_piece($x,$y);
    } else if ($method=='PUT') {
        move_piece($x,$y,$input['x'],$input['y'],  
                   $input['token']);
    }    


}





function updated($method) {
    if($method=='GET') {
        update_game_status2();
  
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
    
}




function take_piece2($method) {
    if($method=='POST') {
        extra_piece() ;
  
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
    
}



function handle_reset($method) {
    if($method=='POST') {
        reset_status() ;
  
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
    
}



function handle_players_info($method, $p,$input) {
    switch ($b=array_shift($p)) {
		//case '':
		//case null: if($method=='GET') {show_users($method);}
				  // else {header("HTTP/1.1 400 Bad Request"); 
						 //print json_encode(['errormesg'=>"Method $method not allowed here."]);}
                    //break;
        case '1': 
		case '2': handle_user($method, $b,$input);
					break;
		default: header("HTTP/1.1 404 Not Found");
				 print json_encode(['errormesg'=>"Player $b not found."]);
                 break;
	}
}





function handle_board($method) {
    if($method=='GET') {
            show_board();
           
    } else if ($method=='POST') {
          reset_board();
           
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
    
}





function handle_status($method) {
    if($method=='GET') {
        show_status();
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
}

function handle_player1($method) {
    if($method=='GET') {
        show_player1();
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
}

function handle_player2($method) {
    if($method=='GET') {
        show_player2();
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
}

 


?>

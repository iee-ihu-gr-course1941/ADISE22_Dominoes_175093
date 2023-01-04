var me={};
var game_status={};

$(function () {
	draw_empty_board();
	draw_hands_board();
	draw_hands_board2(); 
	fill_board() ;
	fill_board2() ;
	fill_board3() ;
	$('#dominoes_reset').click(reset_board);
	$('#dominoes_reset').click(show_allplayers_reset);
	$('#dominoes_login').click(login_to_game);


});





function login_to_game() {

	if($('#username').val()=='') {
	alert('You have to set a username');
	return;
	}
	var seat = $('#seat').val();
	$.ajax({url: "dominoes.php/players_info/"+seat,
	method: 'PUT',
	dataType: "json",
	contentType: 'application/json',
	data: JSON.stringify( {username:$('#username').val(),
	seat: seat}),
	success: login_result,
	error: login_error});
	}


	function login_result(data) {
		me = data[0];
		$('#game_info').show(300);
		$('#game_initializer').hide();
		split_boards();
		update_info();
	
		game_status_update();
		
	}
	
	function login_error(data,y,z,c) {
		var x = data.responseJSON;
		alert(x.errormesg);
	}


	function split_boards() {
		 
	if(me.seat=="1") {
		x=0;
	 
	 
		$('#title_player2').hide(1000);
		$('#dominoes_player2').hide(1000);

		$('#title_player1').show(1000);
		$('#dominoes_player1').show(1000);
		 
	} else if ( me.seat=="2") {
		 
		
		$('#title_player1').hide(1000);
		$('#dominoes_player1').hide(1000);
		 
		$('#title_player2').show(1000);
		$('#dominoes_player2').show(1000);
	}


	}

function game_status_update() {
	
	
	 	$.ajax({url: "dominoes.php/status/", success: update_status});
	 }


	function update_info(){
	
		$('#game_info').html("I am Player: "+me.seat+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.seat_turn+' must play now.');
		
		
	}


	function update_status(data) {

		
		
		game_status=data[0];
		update_info();
		
	
		

		if(game_status.seat_turn==me.seat_turn &&  me.seat_turn!=null) {
			x=0;
			// do play
		 
			$('#move_div').show(1000);
			setTimeout(function() { game_status_update();}, 15000);
		} else {
			// must wait for something
			$('#move_div').hide(1000);
			setTimeout(function() { game_status_update();}, 4000);
		}
		  
	}
 




function draw_empty_board() {
	var t='<table id="dominoes_table">';
	for(var i=2;i>1;i--) {
	t += '<tr>';
	for(var j=1;j<29;j++) {
	t += '<td class="dominoes_square"id="square1_'+j+'">' + j +'</td>';
	}
	t+='</tr>';
	}
	t+='</table>';
	$('#dominoes_board').html(t);
	}
	

function draw_hands_board() {
     var t='<table id="dominoes_table2">';
     for(var i=2;i>1;i--) {
		t += '<tr>';
	  for(var j=1;j<8;j++) {
		t += '<td class="dominoes_square"id="square2_'+j+'">' + j +'</td>';
	}
		t+='</tr>';
	}
	t+='</table>';
	$('#dominoes_player1').html(t);
		}
		
	
function draw_hands_board2() {
	var t='<table id="dominoes_table3">';
	for(var i=2;i>1;i--) {
		t += '<tr>';
			for(var j=1;j<8;j++) {
			t += '<td class="dominoes_square"id="square3_'+j+'">' + j +'</td>';
			}
		t+='</tr>';
		}
		t+='</table>';
	$('#dominoes_player2').html(t);
	}
			

function reset_board(){

	

	$.ajax(
		{url: "dominoes.php/board/",
		method: 'post',
		success: fill_board_by_data
		
		}
		);

	
}


function show_allplayers_reset()
{

	$('#game_initializer').show(600);
	$('#title_player1').show(1000);
	$('#dominoes_player1').show(1000);
	$('#title_player2').show(1000);
	$('#dominoes_player2').show(1000);

	$('#game_info').hide(300);
	
		  


}


	function fill_board() {
		$.ajax(
		{url: "dominoes.php/board/",
		success: fill_board_by_data
		
		}
		);
		}

	function fill_board2() {
		$.ajax(
		{url: "dominoes.php/player1/",
		success: fill_board_by_data2
			}
			);
			}
	 

		function fill_board3() {
				$.ajax(
				{url: "dominoes.php/player2/",
				success: fill_board_by_data3
				}
				);
				}
		 


		function fill_board_by_data(data) {
			for(var i=0;i<data.length;i++) {
			var o = data[i];
			var id = '#square1_'+ o.x ;
			var c = (o.piece!=null)? o.piece:'';
			var im = (o.piece!=null)?'<img class="piece"src="images/board/'+c+'.png">':'';
			$(id).addClass(o.piece+'_square').html(im);
			
			}
			}
			

 
 
			function fill_board_by_data2(data) {
				for(var i=0;i<data.length;i++) {
					var o = data[i];
					var id = '#square2_'+ o.x ;
					var c = (o.piece!=null)? o.piece:'';
					var im = (o.piece!=null)?'<img class="piece2"src="images/hand_board/'+c+'.png">':'';
					$(id).addClass(o.piece+'_square2').html(im);
					
					}
					}
	
	
	
			function fill_board_by_data3(data) {
				for(var i=0;i<data.length;i++) {
					var o = data[i];
					var id = '#square3_'+ o.x ;
				var c = (o.piece!=null)? o.piece:'';
					var im = (o.piece!=null)?'<img class="piece2"src="images/hand_board/'+c+'.png">':'';
					$(id).addClass(o.piece+'_square3').html(im);
					}
				}
			
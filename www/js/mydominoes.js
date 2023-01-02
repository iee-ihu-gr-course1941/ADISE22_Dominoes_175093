var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;

$(function () {
	draw_empty_board();
	draw_hands_board();
	 
});


function draw_empty_board(p) {
	
	if(p!='B') {p='W';}
	var draw_init = {
		'W': {i1:1,i2:0,istep:-1,j1:1,j2:29,jstep:1},
		'B': {i1:1,i2:10,istep:1, j1:5,j2:0,jstep:-1}
	};
	var s=draw_init[p];
	var t='<table id="chess_table">';
	for(var i=s.i1;i!=s.i2;i+=s.istep) {
		t += '<tr>';
		for(var j=s.j1;j!=s.j2;j+=s.jstep) {
			t += '<td class="chess_square" id="square_'+j+'">' + j +'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	
	$('#chess_board').html(t);
	  
}



function draw_hands_board() {
	
 
   
	var t='<table id="chess_table2">';
	for(var i=0;i<10;i++) {
		 
	 
		 
			t += '<tr class="chess_square" id="square_'+i+'">' +i+'</tr>'; 
		 
		t+='</tr>';
	}
	t+='</table>';
	
	$('#dominoes_player').html(t);
 
}




 



 
 

$(function () {
	draw_empty_board();
	draw_hands_board();
	draw_hands_board2(); 
});


function draw_empty_board() {
	var t='<table id="dominoes_table">';
	for(var i=2;i>1;i--) {
	t += '<tr>';
	for(var j=1;j<29;j++) {
	t += '<td class="dominoes_square"id="square_'+j+'">' + j +'</td>';
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
		t += '<td class="dominoes_square"id="square_'+j+'">' + j +'</td>';
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
			t += '<td class="dominoes_square"id="square_'+j+'">' + j +'</td>';
			}
		t+='</tr>';
		}
		t+='</table>';
	$('#dominoes_player2').html(t);
	}
			


 



 



 
 

$(function () {
	draw_empty_board();
	draw_hands_board();
	draw_hands_board2(); 
	fill_board() ;
	fill_board2() ;
	fill_board3() ;
	
});


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
					var im = (o.piece!=null)?'<img class="piece"src="images/board/'+c+'.png">':'';
					$(id).addClass(o.piece+'_square2').html(im);
					
					}
					}
	
	
	
			function fill_board_by_data3(data) {
				for(var i=0;i<data.length;i++) {
					var o = data[i];
					var id = '#square3_'+ o.x ;
				var c = (o.piece!=null)? o.piece:'';
					var im = (o.piece!=null)?'<img class="piece"src="images/board/'+c+'.png">':'';
					$(id).addClass(o.piece+'_square3').html(im);
					}
				}
			
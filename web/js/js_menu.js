$(document).ready(main);
 
var contador = 1;
 
function main(){
	$('.btn_menu').click(function(){
		if(contador == 1){

			$('nav').animate({
				left: '0'
			});
			contador = 0;
			$('.icon-menu3').attr("class", "icon-menu4");
		} 
		else {

			contador = 1;
			$('nav').animate({
				left: '-100%'
			});
			$('.icon-menu4').attr("class", "icon-menu3");
		}
	});
};
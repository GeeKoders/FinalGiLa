$(function(){

	$('#map1').hover(function(){
		$('#map').attr('src','images/map/基隆市.gif');
		$(this).click(function(){
			 $('#map').attr('src','images/map/基隆市.gif');
		});
	},
	function(){

	});

	$('#map2').hover(function(){
		$('#map').attr('src','images/map/台北市.gif');
		$(this).click(function(){
			 $('#map').attr('src','images/map/台北市.gif');
		});
	},
	function(){

	});

	$('#map3').hover(function(){
		$('#map').attr('src','images/map/新北市.gif');
		$(this).click(function(){
			 $('#map').attr('src','images/map/新北市.gif');
		});
	},
	function(){

	});
	
	$('#map4').hover(function(){
		$('#map').attr('src','images/map/桃園縣.gif');
		$(this).click(function(){
			$('#map').attr('src','images/map/桃園縣.gif');
		});
	},
	function(){

	});

	$('#map5').hover(function(){
		$('#map').attr('src','images/map/新竹縣.gif');
		$(this).click(function(){
			$('#map').attr('src','images/map/新竹縣.gif');
		});
	},
	function(){

	});

	$('#map6').hover(function(){
		$('#map').attr('src','images/map/苗栗縣.gif');
		$(this).click(function(){
			$('#map').attr('src','images/map/苗栗縣.gif');
		});
	},
	function(){

	});
	
	function hide_all(){
		$('#map').attr('src','images/map/map.gif');			
	}
	
});
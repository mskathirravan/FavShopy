jQuery(document).ready(function($){
	$('.dropdown-trigger').dropdown({
	    constrainWidth: false
	});
	$('.sidenav').sidenav();
	$('.modal').modal();

	$(document).ready(function(){
    $('.datepicker').datepicker();
  });
})

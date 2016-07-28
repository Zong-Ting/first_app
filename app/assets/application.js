$(function() {
    $('li.user[user_id].btn').click(function(event){
	    var $this = $(this);
		var userId = $this.parent().attr('user_id');
		if($(this).hasClass('btn-primary')){
		    $.ajax({
			    url: '/users'+userId+'/follow',
				type: 'POST',
				success: function(data, status){
				    $this.html('Unfollow').removeClass('btn-primary');
				},
			});
		} else {
		    $.ajax({
			    url: '/users'+userId+'/unfollow',
				type: 'DELETE',
				success: function(data, status){
				    $this.html('Follow').addClass('btn-primary');
				},
			});
		}
		event.preventDefault();
	})
});
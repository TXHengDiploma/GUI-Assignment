(function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };
    
    // Toggle the side navigation when window is resized below 480px
    if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
      $("body").addClass("sidebar-toggled");
      $(".sidebar").addClass("toggled");
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var e0 = e.originalEvent,
        delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  $(document).on('click', 'a.scroll-to-top', function(e) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    e.preventDefault();
  });

  // data-ajax-modal scripts


  $(document).on('click','[data-ajax-modal]',function(e){
    e.preventDefault();
    $("#ajax-modal").html(`
    <div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="loading-err-center">
						<div class="spinner-border" role="status">
							<span class="sr-only">Loading...</span>
						</div>
					</div>
				</div>
			</div>
		</div>
    `);

    $("#ajax-modal").modal("show");

    $.get($(this).data('ajax-modal'))
      .done(function(res){
        $("#ajax-modal").html(res);
        $("#ajax-modal").find('[data-toggle="tooltip"]').tooltip({container:'body'});
      })
      .fail(function(err){
        $("#ajax-modal").html(`
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title text-danger">ERROR</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="loading-err-center">
                <i class="fa fa-exclamation-triangle text-danger" style="font-size: 50px;"></i>
                <p id="modal-error-msg">${err.statusText}</p>
              </div>
            </div>
          </div>
        </div>
        `);
      });
  });

  let myajaxhtml = [];
  jQuery.fn.extend({
    ajax_html: function(url){
      var element = $(this);
      element.html(`<div class="loading-err-center"><div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div></div>`);
      if(url != undefined) element.data('ajax-html', url);
      if(!element.data('ajax-html') ) return false;

      var myajaxhtmldefine = 'global';
      if($(this).data('ajax-div')){
        myajaxhtmldefine = $(this).data('ajax-div');
      }else if($(this).attr('id')){
        myajaxhtmldefine = $(this).attr('id');
      }

      myajaxhtml[myajaxhtmldefine] = $.ajax({
        url: element.data('ajax-html'),
        beforeSend: function(){
          try{myajaxhtml[myajaxhtmldefine].abort();}catch(e){}
        },
        success: function(data){
          element.html(data);
          // Reinit tooltip
          element.find('[data-toggle="tooltip"]').tooltip({
            container: 'body'
          });
        },
        error: function(err){
          var error = 'Internal Server Error';
          if(err.statusText){
            error = err.statusText;
          }
          element.html(`
          <div class="loading-err-center">
            <i class="fa fa-exclamation-triangle text-danger" style="font-size: 50px;"></i>
            <p id="modal-error-msg">${error}</p>
          </div>`);
        }
      });
      return true;
    }
  });

  $('[data-ajax-html]').each(function(){
    $(this).ajax_html();
  })

  $(document).on('submit', 'form:not([no-ajax])', function(e) {
    e.preventDefault();
    let $form = $(this);
    if ($form.data('cshid')) {
        return true;
    }
    $.ajax({
        url: $form.attr('action'),
        type: $form.attr('method'),
        data: $form.serialize(),
        cache: false,
        processData: false,
        dataType: "json",
        beforeSend: function() {
            $("[type='submit']").addClass("btn-loading");
            $("[type='submit']").prop("disabled", true);
        },
        success: function(response) {
            $("[type='submit']").removeClass("btn-loading");
            $("[type='submit']").prop("disabled", false);
            if (response.hasOwnProperty('script')) {
                eval(response.script);
            }
            if (response.hasOwnProperty('error')) {
                eval(response.error);
            }
        },
        error: function(response) {
            $("[type='submit']").removeClass("btn-loading");
            $("[type='submit']").prop("disabled", false);
            if (response.readyState == 0) {
                $.notify("Network Error", "danger");
                return false;
            }
            if (response.status === 419) {
                $.notify("Session expired", "danger");
                return false;
            }
            if (response.status === 401) {
                $.notify("Unauthorized", "danger");
                return false;
            }
            if (response.status === 422) {
                var errors = response.responseJSON.errors ? response.responseJSON.errors : response.responseJSON;
                $.each(errors, function(key, value) {
                    if ($form.data('error-notify')) {
                        $.notify(value[0], "danger");
                    } else {
                        $form.find("[name='" + key + "']").parsley().reset();
                        window.ParsleyUI.addError($form.find("[name='" + key + "']").parsley(), "ajax", value[0]);
                    }
                });
                return false;
            }
            if ($form.data('error-reload')) {
                location.reload();
                return true;
            }
            $.notify("Connection Error", "danger");
        }
    });
    return false;
  });
})(jQuery); // End of use strict

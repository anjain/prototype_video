$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true,
  })
  $(document).on('click', '.edit_profile_pic', function(){
    $('#user_user_profile_attributes_image').click()
  })
  $(document).on('change','#user_user_profile_attributes_image', function(event){
    var preview = $("img.upload_pic");
    var input = $(event.currentTarget);
    var file = input[0].files[0];
    var reader = new FileReader();
    reader.onload = function(e){
     image_base64 = e.target.result;
     preview.attr("src", image_base64);
    };
    reader.readAsDataURL(file);
  });

  var slider = new Slider('.skill_slider_1', {
    formatter: function(value) {
      return 'Current value: ' + value;
    }
  });
  
  var slider = new Slider('.skill_slider_2', {
    formatter: function(value) {
      return 'Current value: ' + value;
    }
  });

  var slider = new Slider('.skill_slider_3', {
    formatter: function(value) {
      return 'Current value: ' + value;
    }
  });
})

$(document).on('click', '.video-settings-section', function(){
  if ($('.uploaded_video').css('opacity')=='0') {
    $('.uploaded_video').css('opacity','1');
    $('.record_video').css('opacity','0');
  } else{
    $('.uploaded_video').css('opacity','0');
    $('.record_video').css('opacity','1');
  };
  $('.video-settings-section img').toggleClass('display_none');
});
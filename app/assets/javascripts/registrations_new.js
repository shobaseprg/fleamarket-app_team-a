$(function(){
  var password = '#password';
  var passcheck = '#js-passcheck';
  $(passcheck).change(function(){
    const passwordLabel = document.querySelector('.js-password-label');
    if ($(this).prop('checked')){
      $(password).attr('type','text');
      passwordLabel.innerHTML = '<i class="fas fa-eye" style="font-size:20px;color:#808080"></i>';
    } else {
      $(password).attr('type','password');
      passwordLabel.innerHTML = '<i class="fas fa-eye-slash" style="font-size:20px;color:#808080"></i>';
    }
  })
})
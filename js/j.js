$(document).ready(function() {
  $('#name').text('Krutika');
  $("#menu_button").click(function(){
    $("#menu").toggle(1000);
    $("#menu2").hide(1000);
    $("#menu3").hide(1000);
  });
  $("#menu_button2").click(function(){
    $("#menu2").toggle(1000);
    $( "#menu").hide(1000);
    $("#menu3").hide(1000);
  });
  $("#menu_button3").click(function(){
    $("#menu3").toggle(1000);
    $("#menu").hide(1000);
    $("#menu2").hide(1000);
  });
  $('#menuButton').click(function(){
    $('#rightmenu').toggle(1000);
  });

  $('#personal').click(function(){
    hideall();
    $('#personalform').toggle(1000);
  });

  $('#post').click(function(){
    hideall();
    $('#postad').toggle(1000);
  });

  $('#search2').click(function(){
    $('#searchresults').toggle();
  });
  $("#datepicker").datepicker();
});

function hideall()
{
  $("#personalform").hide(1000);
  $("#postad").hide(1000);
  $("#viewads").hide(1000);
}
function checkForm(form)
{
    if(form.password.value != "" && form.password.value == form.password2.value) {
      if(form.password.value.length < 6) {
        alert("Error: Password must contain at least six characters!");
        form.password.focus();
        return false;
      }
    } else {
      alert("Error: Please check that you've entered and confirmed your password!");
      form.password.focus();
      return false;
    }
    return true;
  }

$(document).ready(function() {
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
    $('#rightmenu').slideToggle(1000);
  });


  $('#personal').click(function(){
    hideall();
    $('#personalform').toggle();
  });

$("#skillset").click(function(){
  hideothers();
  $("#skillform").toggle();
});

$("#experience").click(function(){
  hideothers();
  $("#expform").toggle();
});

$("#certificate").click(function(){
  hideothers();
  $("#certform").toggle();
});

  $('#work').click(function(){
    hideall();
    $('#workform').toggle();
  });
  $('#cb1').click(function(){
    hideall2();
    $('#project').toggle();
  });

  $('#cb2').click(function(){
    hideall2();
    $('#intern').toggle();
  });
  $('#post').click(function(){
    hideall();
    $('#postad').toggle();
  });

  $('#ChangePassword').click(function(){
    hideall();
    $('#changepassword').toggle();
  });


});

function hideall()
{

  $("#personalform").hide();
  $("#postad").hide();
  $("#viewads").hide();
  $("#changepassword").hide();
  $("#searchresult").hide();

}
function hideall2()
{

  $("#project").hide();
  $("#job").hide();
  $("#intern").hide();
$("#training").hide();
}
function hideothers()
{

  $("#skillform").hide();
  $("#certform").hide();
  $("#expform").hide();

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

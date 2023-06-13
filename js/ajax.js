var xmlHttp = createXmlHttpRequestObject()

function createXmlHttpRequestObject(){
    var xmlHttp;

    if(window.ActiveXObject){
        try{
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }catch(e){
            xmlHttp = false;
        }
    }else{
        try{
            xmlHttp = new XMLHttpRequest();
        }catch(e){
            xmlHttp = false;
        }
    }

    if(!xmlHttp)
        alert("cant create that object hoss!");
    else
        return xmlHttp;
}

function main()
{
  $("#personalform").hide(1000);
  $("#postad").hide(1000);
  $("#changepassword").hide();
  $('#viewads').toggle();
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
        xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
        	   if( xmlHttp.status==200)
             {
                  //alert(xmlHttp.responseText);
                  var res = eval ("(" + xmlHttp.responseText + ")");
                  for(i=0;i<res.ad.length;i++)
                  {
                    $('#ad'+(i+1)).toggle();
                    document.getElementById('adname'+(i+1)).innerHTML=res.ad[i].title;
                    document.getElementById('adfield'+(i+1)).innerHTML=res.ad[i].field;
                    //alert(res.ad[i].title);
                    //alert(res.ad[i].field);
                  }
              }
              else
              {
                  alert('Something went wrong!');
              }
        	}
        };
        xmlHttp.open("GET", "/lookfreelanzers/ShowMyAds", true);
        xmlHttp.send(null);

      }else{
        setTimeout('main()', 1000);
    }
}

function gotoprofile(var x)
{
  window.location="profilepage.jsp/"+x;
}
function ajaxsearch()
{
  $("#personalform").hide();
  $("#postad").hide();
  $('#viewads').hide();
  $("#changepassword").hide();
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
      xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
             if( xmlHttp.status==200)
               {
                    alert(xmlHttp.responseText);
                    var obj = eval ("(" + xmlHttp.responseText + ")");
                    for(i=0;i<obj.result.length;i++)
                    {
                      alert(obj.result[i].name);
                      alert(obj.result[i].workfield);
                    }
                }
                else{
                    alert('Something went wrong!');
                }
          }
        };
        var search = document.getElementById("search").value;
        var searchin = document.getElementById("searchin").value;
        xmlHttp.open("GET", "/lookfreelanzers/SearchResult?search="+search+"&searchin="+searchin, true);
        xmlHttp.send(null);

      }else{
        setTimeout('ajaxsearch()', 1000);
    }
}

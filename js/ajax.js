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
  $('#viewads').toggle();
  $("#changepassword").hide();
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
        xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
        	   if( xmlHttp.status==200)
               {
                    alert(xmlHttp.responseText);
                    var res = eval("("+xmlHttp.responseText+")");
                    alert(res.ad[0].adid);
                    alert(res.ad[0].name);
                }
                else{
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

function ajaxsearch()
{
  $("#personalform").hide();
  $("#postad").hide();
  $('#ViewAds').hide();
  $("#changepassword").hide();
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
      xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
             if( xmlHttp.status==200)
               {
                    alert(xmlHttp.responseText);
                    var obj = eval ("(" + xmlHttp.responseText + ")");
                    alert(obj.result[0].name);
                    alert(obj.result[0].workfield);
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

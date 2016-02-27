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
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
        alert("2nd checkpoint f(main) - readyState: " + xmlHttp.readyState);//
        xmlHttp.onreadystatechange =function (){
            alert(xmlHttp.readyState);
            alert(xmlHttp.status);
            if(xmlHttp.readyState==4){
        	   if( xmlHttp.status==200)
               {
                    document.getElementById("viewads").innerHTML = xmlHttp.responseText;
                    response = eval('('+xmlHttp.responseText+')');
                    document.getElementById("viewads").innerHTML = response;//.name;
                    //setTimeout('process()', 1000);
                }
                else{
                    alert('Something went wrong!');
                }
        	}
        };
        xmlHttp.open("GET", "/lookfreelanzers/ShowMyAds", true);
        //xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlHttp.send(null);

      }else{
        setTimeout('main()', 1000);
    }
}

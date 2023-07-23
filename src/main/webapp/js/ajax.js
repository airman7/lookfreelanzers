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
        alert("cant create that object");
    else
        return xmlHttp;
}

function main()
{
  $("#personalform").hide();
  $("#postad").hide();
  $("#changepassword").hide();
  $('#searchresult').hide();
  $('#viewads').show();
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
        xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
        	   if( xmlHttp.status==200)
             {
                  var res = eval ("(" + xmlHttp.responseText + ")");
                  for(i=0;i<res.ad.length;i++)
                  {
                    $('#ad'+(i+1)).show();
                    document.getElementById('adname'+(i+1)).innerHTML='Ad Title:'+res.ad[i].title;
                    document.getElementById('adfield'+(i+1)).innerHTML='Work field:'+res.ad[i].field;
                    document.getElementById('adid'+(i+1)).innerHTML=res.ad[i].adid;
                    document.getElementById('startdate'+(i+1)).innerHTML='Start Date:'+res.ad[i].sdate;
                    document.getElementById('enddate'+(i+1)).innerHTML='End Date:'+res.ad[i].edate;
                    document.getElementById('addescription'+(i+1)).innerHTML='Description:'+res.ad[i].desc;
                    document.getElementById('adapplied'+(i+1)).innerHTML='Freelancers Applied::'+res.ad[i].applied;
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

function people(x)
{
  var z = 'adid'+x;
  var y=document.getElementById(z).innerHTML;

  $("#personalform").hide();
  $("#postad").hide();
  $("#changepassword").hide();
  $("#viewads").hide()
  $("#sr1").hide();
  $("#sr2").hide();
  $("#sr3").hide();
  $("#sr4").hide();

  $('#searchresult').show();
  //add others too
    if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
        xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
        	   if( xmlHttp.status==200)
             {
              //  alert(xmlHttp.responseText);
                  var res = eval ("(" + xmlHttp.responseText + ")");
                  for(i=0;i<res.applyer.length;i++)
                  {
                    $('#sr'+(i+1)).show();
                    document.getElementById('srname'+(i+1)).innerHTML=res.applyer[i].name;
                    document.getElementById('srfield'+(i+1)).innerHTML=res.applyer[i].work;
                    document.getElementById('srcontact'+(i+1)).innerHTML=res.applyer[i].contact;
                    document.getElementById('sremail'+(i+1)).innerHTML=res.applyer[i].email;
                    document.getElementById('srid'+(i+1)).innerHTML=res.applyer[i].id;

                  }
              }
              else
              {
                  alert('Something went wrong!');
              }
        	}
        };
        xmlHttp.open("GET", "/lookfreelanzers/ShowPeople?adid="+y, true);
        xmlHttp.send(null);

      }else{
        setTimeout('people()', 1000);
    }
}

function gotoprofile(x)
{
  var z = 'srid'+x;
  var y=document.getElementById(z).innerHTML;
  window.location="freelancer.jsp?id="+y;
}

function ajaxsearch()
{
  $("#personalform").hide();
  $("#postad").hide();
  $('#viewads').hide();
  $("#changepassword").hide();
  $("#sr1").hide();
  $("#sr2").hide();
  $("#sr3").hide();
  $("#sr4").hide();
  $("#searchresult").show();
  //add others too
  if(xmlHttp.readyState==0 || xmlHttp.readyState==4){
      xmlHttp.onreadystatechange =function (){
            if(xmlHttp.readyState==4){
             if( xmlHttp.status==200)
               {
                  //  alert(xmlHttp.responseText);
                    var obj = eval ("(" + xmlHttp.responseText + ")");

                    for(i=0;i<obj.result.length;i++)
                    {
                      $('#sr'+(i+1)).show();
                      document.getElementById('srname'+(i+1)).innerHTML=obj.result[i].name;
                      document.getElementById('srfield'+(i+1)).innerHTML=obj.result[i].workfield;
                      document.getElementById('srcontact'+(i+1)).innerHTML=obj.result[i].cont;
                      document.getElementById('sremail'+(i+1)).innerHTML=obj.result[i].mail;
                      document.getElementById('srid'+(i+1)).innerHTML=obj.result[i].id;
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

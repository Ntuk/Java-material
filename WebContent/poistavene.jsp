<%@ page language="java"%>
<%@ page import="dao.Dao"%>
<%@ page import="model.Vene"%>
<%@ page import="java.util.List,java.util.ArrayList,java.util.Iterator"%>
<%! @SuppressWarnings ("unchecked")%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
    <title>Venetietokanta</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
  </head>

<%
Vene vene=null;
if(request.getAttribute("vene")!=null){	
	vene = (Vene)request.getAttribute("vene");
}else{
	response.sendRedirect("haevene.jsp");
}
%>

  <body>

    <!-- Static navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	 <li><a href="index.jsp">Etusivu</a></li>
             <li><a href="venelistaus.jsp">Listaa veneet</a></li>           
             <li><a href="venehaku.jsp">Hae veneit‰</a></li>
             <li><a href="lisaavene.jsp">Lis‰‰ vene</a></li>
            <li><a href="muutavene.jsp">Muuta vene</a></li>
            <li class="active"><a href="poistavene.jsp">Poista vene</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>


  <div id="headerwrap">
      <div class="container">
      <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
          <br>
          <h1>VENETIETOKANTA</h1>
        </div>
      </div><! --/row -->
      </div> <!-container -->
  </div><! --/headerwrap -->
	
	<div class="container">
		<div class="row centered mt-xs mb">
			<div style="width: 95%; margin:0 auto;">
				<h2>Poista vene</h2>
				<img src="./assets/img/erotus.png"><br><br>
				
<form action="PoistaVene" method="post" name="poistaLomake" id="poistaLomake">
<table>
<%out.print("<tr><td>Tunnus: " + request.getParameter("tunnus") + "</td></tr>");%>
<%out.print("<tr><td>Nimi: " + vene.getNimi() + "</td></tr>");%>
<%out.print("<tr><td>Malli: " + vene.getMerkkimalli() + "</td></tr>");%>
<%out.print("<tr><td>Pituus: " + vene.getPituus() + " m</td></tr>");%>
<%out.print("<tr><td>Leveys: " + vene.getLeveys() + " m</td></tr>");%>
<%out.print("<tr><td>Hinta: " + vene.getHinta() + " euroa</td></tr>");%>

<tr>
<p><input type="submit" value="Vahvista veneen poisto">
<input type="button" class="perusnappi" value="Siirry takaisin" id="takaisin"></p>
</tr>
</table>
<input type="hidden" name="tunnus" value="<%=request.getParameter("tunnus")%>">
</form><br>

%>				
			<div class="containeri">
				<table id='taulukko'>
<tr>
<td><b>Nimi</td>
<td><b>Merkki / Malli</td>
<td><b>Pituus</td>
<td><b>Leveys</td>
<td><b>Hinta</b></td>
</tr>
<%
if(request.getAttribute("Veneet")!=null){	
	ArrayList<Vene> Veneet = (ArrayList<Vene>)request.getAttribute("Veneet");
	for(int i=0;i<Veneet.size();i++){
		out.print("<tr>");
		out.print("<td>" + Veneet.get(i).getNimi() + "</td>");
		out.print("<td>" + Veneet.get(i).getMerkkimalli() + "</td>");   
		out.print("<td>" + Veneet.get(i).getPituus() + "</td>");
		out.print("<td>" + Veneet.get(i).getLeveys() + "</td>");
		out.print("<td>" + Veneet.get(i).getHinta() + "</td>");		
		out.print("<td><a class='poista' href='PoistaVene?poista_tunnus="+Veneet.get(i).getTunnus()+"'><abbr title='Poista'>X</abbr></a>&nbsp;" + "</td>");
		out.print("</tr>");
	}	
}
%>
				</table>
		<input type="hidden" name="tunnus" value="<%=request.getParameter("tunnus")%>">
			</div>
			</div>

		</div><! --/row -->
	</div><! --/container -->
	

  <div id="footerwrap">
      <div class="row centered">
        <div class="col-lg-4">
          <div class="jalka">
       <a href="http://hhmoodle.haaga-helia.fi/course/view.php?id=15514"><i class="fa fa-ship"></i></a>
        </div>
        </div>
        <div class="col-lg-4">
          <p><b>© a1702576 / TUKIAINEN NICO 2017</b></p>
        </div>
        <div class="col-lg-4">
          <p>Ohjelmointitentti SWD4TA002-3</p>
        </div>
        
    </div>
  </div><! --/footerwrap -->
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</div>
<script>
	$(document).ready(function(){
		$("#nimi").focus();
	    $("#takaisin").click(function(){	    	
	    	window.history.back();
	    });	
		});

</script>
  </body>
</html>

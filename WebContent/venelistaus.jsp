<%@ page language="java"%>
<%@ page import="model.Vene"%>
<%@ page import="java.util.ArrayList"%>
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
	<script src="assets/js/bootstrap.min.js"></script>
    <title>Venetietokanta</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
  </head>

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
             <li class="active"><a href="venelistaus.jsp">Listaa veneet</a></li>           
             <li><a href="venehaku.jsp">Hae veneit‰</a></li>
             <li><a href="lisaavene.jsp">Lis‰‰ vene</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>


  <div id="headerwrap">
      <div class="container"><br>
      <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
          <h1>VENETIETOKANTA</h1>
        </div>
      </div><! --/row -->
      </div> <!-container -->
  </div><! --/headerwrap -->
	
	<div class="container">
		<div class="row centered mt-xs mb">
			<div style="width: 95%; margin:0 auto;">
				<h2>Listaa veneet</h2>
				<img src="./assets/img/erotus.png"><br><br>

<form action="ListaaVeneet" method="post">
<input type="submit" value="Listaa kaikki veneet">
</form><br>

				     <div class="containeri">
				
				<table id='taulukko'>
<tr>
<%--<td><b>Tunnus</b></td>--%>
<td><b>Nimi</b></td>
<td><b>Merkki / Malli</b></td>
<td><b>Pituus</b></td>
<td><b>Leveys</b></td>
<td><b>Hinta</b></td>
</tr>

<%
if(request.getAttribute("Veneet")!=null){	
	ArrayList<Vene> Veneet = (ArrayList<Vene>)request.getAttribute("Veneet");
	for(int i=0;i<Veneet.size();i++){
		out.print("<tr>");
		// out.print("<td>" + Veneet.get(i).getTunnus() + "</td>");	Kommentoin tunnuksen pois n‰kyvist‰
		out.print("<td>" + Veneet.get(i).getNimi() + "</td>");
		out.print("<td>" + Veneet.get(i).getMerkkimalli() + "</td>");
		out.print("<td>" + Veneet.get(i).getPituus() + "</td>");
		out.print("<td>" + Veneet.get(i).getLeveys() + "</td>");
		out.print("<td>" + Veneet.get(i).getHinta() + "</td>");		
		out.print("<td><a class='ikonit' href='PoistaVene?poista_tunnus="+Veneet.get(i).getTunnus()+"'><abbr title='Poista'><i class='fa fa-trash'></i></abbr></a>&nbsp;" + "</td>");
		out.print("<td><a class='ikonit' href='EtsiMuutaVene?tunnus="+Veneet.get(i).getTunnus()+"'><abbr title='Muuta'><i class='fa fa-edit'></i></abbr></a></td>\n");
		out.print("</tr>");
	}	
}
%>
				</table>
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
  
    <script>
    $(document).ready(function(){
    	'ListaaVeneet';
    });
    

</script>
  </body>
</html>

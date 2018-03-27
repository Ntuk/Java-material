<%@ page language="java"%>
<%@ page import="dao.Dao"%>
<%@ page import="model.Vene"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List,java.util.ArrayList,java.util.Iterator"%>
<%! @SuppressWarnings ("unchecked")%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
    <title>Venetietokanta</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
    <script>
	$(document).ready(function(){
		$("#nimi").focus();
	    $("#takaisin").click(function(){	    	
	    	window.history.back();
	    });
	    $("form[name='muutaLomake']").validate({												
			rules: {
				nimi:  {
					required: true,
					minlength: 2,
					maxlength: 30
				},	
				merkkimalli:  {
					required: true,
					minlength: 2,
					maxlength: 30
				},
				pituus:  {
					required: true,
					number: true,
					minlength: 1,
					maxlength: 4
				},	
				leveys:  {
					required: true,
					number: true,
					minlength: 1,
					maxlength: 4
				},
				hinta: {
					required: true,
					number: true,
					minlength: 1,
					maxlength: 7
				}
			},
			messages: {
				nimi: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
					
				},
				merkkimalli: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				pituus: {
					required: "Pakollinen",
					number: "Syötä numeroarvo",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				leveys: {
					required: "Pakollinen",
					number: "Syötä numeroarvo",
					minlength: "Leveys ei riitä",
					maxlength: "Liian leveä"
				},
				hinta: {
					required: "Pakollinen",
					number: "Syötä numeroarvo",
					minlength: "Hinta liian alhainen",
					maxlength: "Hinta liian korkea"
				}
			},			
			submitHandler: function (form) {
				document.forms["muutaLomake"].submit();
			}		
		});
	});
</script>
  </head>
<%
String nimi="";
if(request.getParameter("nimi")!=null){
	nimi=request.getParameter("nimi");
}
String merkkimalli="";
if(request.getParameter("merkkimalli")!=null){
	merkkimalli=request.getParameter("merkkimalli");
}
String pituus="";
if(request.getParameter("pituus")!=null){
	pituus=request.getParameter("pituus");
}
String leveys="";
if(request.getParameter("leveys")!=null){
	leveys=request.getParameter("leveys");
}
String hinta="";
if(request.getParameter("hinta")!=null){
	hinta=request.getParameter("hinta");
}
int tunnus=-1;
if(Integer.parseInt(request.getParameter("tunnus"))>0){
	tunnus = Integer.parseInt(request.getParameter("tunnus"));	
}

Vene vene=null;

if(request.getAttribute("vene")!=null){    

	vene = (Vene)request.getAttribute("vene");

	}else{

	   response.sendRedirect("venehaku.jsp");

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
             <li><a href="venehaku.jsp">Hae veneitä</a></li>
             <li><a href="lisaavene.jsp">Lisää vene</a></li>
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
      </div><%-- /row --%>
      </div> <%-- /container --%>
  </div><%-- /headerwrap --%>
	
	<div class="container">
		<div class="row centered mt-xs mb">
			<div style="width: 95%; margin:0 auto;">
				<h2>Muuta veneen tietoja</h2>
				<img src="./assets/img/erotus.png"><br><br>
				
			<div class="containeri">
			
				<form action="MuutaVene" method="post" name="muutaLomake" id="muutaLomake">
				<table>
				<tr>
				<th align="right">Nimi:</th>
				<td><input type="text" name="nimi" id="nimi" value="<%=nimi%>"></td>
				</tr>
				<tr>
				<th align="right">Merkki / Malli:</th>
				<td><input type="text" name="merkkimalli" id="merkkimalli" value="<%=merkkimalli%>"></td>
				</tr>
				<tr>
				<th align="right">Pituus:</th>
				<td><input type="text" name="pituus" id="pituus" value="<%=pituus%>"></td>
				</tr>
				<tr>
				<th align="right">Leveys:</th>
				<td><input type="text" name="leveys" id="leveys" value="<%=leveys%>"></td>
				</tr>
				<tr>
				<th align="right">Hinta:</th>
				<td><input type="text" name="hinta" id="hinta" value="<%=hinta%>"></td>
				</tr>
				<tr>
				<td colspan="2"><input type="submit" value="Vahvista muutos">
								<input type="button" value="Takaisin" id="takaisin">
				</td>
				</tr>
				</table>
				<input type="hidden" name="tunnus" value="<%=tunnus%>">
				</form>

			</div>
			</div>

		</div><%-- /row --%>
	</div><<%-- /container --%>
	

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
	
  </body>
</html>

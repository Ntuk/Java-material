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
		$("input[name='nimi']").focus();
	    $("#etusivulle").click(function(){	    	
	    	window.location.href = 'index.jsp';
	    });
	    
	    $("form[name='lisaysLomake']").validate({						
			rules: {
				nimi:  {
					required: true,
					minlength: 2,
					maxlength: 20
				},	
				merkkimalli:  {
					required: true,
					minlength: 2,
					maxlength: 30
				},
				pituus:  {
					number: true,
					required: true,
					minlength: 1,
					maxlength: 4
				},	
				leveys:  {
					number: true,
					required: true,
					minlength: 1,
					maxlength: 4
				},
				hinta:  {
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
					minlength: "leveys ei riitä",
					maxlength: "Liian leveä"
				},
				hinta: {
					required: "Pakollinen",
					number: "Syötä numeroarvo",
					maxlength: "Hinta liian suuri"
				}
			},			
			submitHandler: function (form) {
				document.forms["lisaysLomake"].submit();
			}		
		});
	});

</script>
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
             <li><a href="venelistaus.jsp">Listaa veneet</a></li>           
             <li><a href="venehaku.jsp">Hae veneitä</a></li>
             <li class="active"><a href="lisaavene.jsp">Lisää vene</a></li>
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
				<h2>Lisää vene</h2>
				<img src="./assets/img/erotus.png"><br><br>
				
			<div class="containeri">
			
				<form action="LisaaVene" method="post" name="lisaysLomake" id="lisaysLomake">
					<table>
					<tr>
					<td align="left">Nimi:</td>
					<td><input type="text" name="nimi"></td>
					</tr>
					<tr>
					<td align="left">Merkki / Malli:</td>
					<td><input type="text" name="merkkimalli"></td>
					</tr>
					<tr>
					<td align="left">Pituus:</td>
					<td><input type="text" name="pituus"></td>
					</tr>
					<tr>
					<td align="left">Leveys:</td>
					<td><input type="text" name="leveys"></td>
					</tr>
					<tr>
					<td align="left">Hinta:</td>
					<td><input type="text" name="hinta"></td>
					</tr>
					<tr>
					
					<td colspan="2">
					<input type="submit" id="submit" value="Lisää">
					<input type="button" value="Etusivulle" id="etusivulle">
					</td>
					</tr>
</table>
</form><br>
<%
if(request.getParameter("ilmo")!=null){
	if(request.getParameter("ilmo").equals("1")){
		out.print("Veneen lisääminen onnistui");	
	}else if(request.getParameter("ilmo").equals("0")){
		out.print("Veneen lisääminen ei onnistunut");	
	}
}
%>
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
	
  </body>
</html>

<html>
<head>
<title>Sistema Administrativo ZOFPLUS</title>
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link rel="StyleSheet" type="text/css" href="css/estilo_login.css"/>
<script src="JS/jquery126.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script>
    $(document).ready(function() {
	$('a.login-window').click(function() {

                //Getting the variable's value from a link
		var loginBox = $(this).attr('href');

		//Fade in the Popup
		$(loginBox).fadeIn(300);

		//Set the center alignment padding + border see css style
		var popMargTop = ($(loginBox).height() + 24) / 2;
		var popMargLeft = ($(loginBox).width() + 24) / 2;

		$(loginBox).css({
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});

		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);

		return false;
	});

	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() {
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();
	});
	return false;
	});
});


</script>

</head>
<body>
    <br><br><br><br><br><br><br><br><br><br><br>
    <center><a href="#login-box" class="login-window"><img src="img/index_back.png" /></a></center>

<div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="img/logo_small.png" class="btn_close" title="Close Window" alt="Close" /></a>
          <form method="post" class="signin" action="inicio.jsp">
                <fieldset class="textbox">
            	<label class="username">
                <span>Nombre de Usuario</span>
                <input id="username" name="username" value="" type="text" autocomplete="on" placeholder="Usuario">
                </label>
                <label class="password">
                <span>Clave</span>
                <input id="password" name="password" value="" type="password" placeholder="Clave">
                </label>
                <label class="tipo">
                <span>Tipo Acceso</span>
                <select>
                    <option>Administrador</option>
                    <option>Bodeguero</option>
                    <option>Facturador</option>
                    <option>Vendedor</option>
                </select>
                </label>
                <button class="submit button" type="submit">Ingresar</button>
                <p>
                <!--<a class="forgot" href="#">Forgot your password?</a>-->
                </p>
                </fieldset>
          </form>
</div>


</body>
</html>
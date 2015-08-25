<%-- 
    Document   : head
    Created on : 24-03-2012, 01:50:09 PM
    Author     : Tebi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistema Administrativo ZofPlus</title>
<%-- TODOS LOS CSS--%>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link href="css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
<link href="css/demo_table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/datePicker.css">
<style>
	.ui-button { margin-left: -1px; margin-bottom: -10px; height: 90%;   }
	.ui-button-icon-only .ui-button-text { padding: 0.35em; }
	.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
</style>


<!-- 	Para Agregar el Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />


<%-- TODOS LOS JS--%>
<!-- 	Agregamos el jquery-->
        <script type="text/javascript" language="JavaScript" src="js/jquery.js"></script>
<!-- 	Agregamos el jqueryUI Core-->
<script type="text/javascript" language="JavaScript" src="js/jquery.ui.core.js"></script>
<!-- 	Agregamos el jqueryUI widget-->
<script type="text/javascript" language="JavaScript" src="js/jquery.ui.widget.js"></script>
<!-- 	Agregamos el jqueryUI button-->
<script type="text/javascript" language="JavaScript" src="js/jquery.ui.button.js"></script>
<!-- 	Agregamos el jqueryUI position-->
<script type="text/javascript" language="JavaScript" src="js/jquery.ui.position.js"></script>
<!-- 	Agregamos el jqueryUI autocomplete-->
<script type="text/javascript" language="JavaScript" src="js/jquery.ui.autocomplete.js"></script>

<!-- 	Agregamos el plugin validate-->
        <script type="text/javascript" language="JavaScript" src="js/jquery.validate.js"></script>
<!-- 	Agregamos que los mensajes sean en español-->
        <script type="text/javascript" language="JavaScript" src="js/messages_es.js"></script>
<!-- 	Agregamos que la grilla-->
<script type="text/javascript" language="JavaScript" src="js/jquery.dataTables.js"></script>
<!-- 	Validacion RUT-->
<script type="text/javascript" language="JavaScript" src="js/jquery.Rut.js"></script>
<!-- 	Validacion RUT-->
<script type="text/javascript" language="JavaScript" src="js/jquery.Rut.min.js"></script>
<!-- 	Para Elegir Fecha-->
<script type="text/javascript" language="JavaScript" src="js/jquery.datePicker.js"></script>
<script type="text/javascript" language="JavaScript" src="js/date.js"></script>
<link rel="StyleSheet" type="text/css" href="estilo_maqueta_i.css"/>
<script type="text/javascript" src="http://indicador.eof.cl/js"></script>


<script type="text/javascript">
	(function( $ ) {
		$.widget( "ui.combobox", {
			_create: function() {
				var self = this,
					select = this.element.hide(),
					selected = select.children( ":selected" ),
					value = selected.val() ? selected.text() : "";
				var input = this.input = $( "<input>" )
					.insertAfter( select )
					.val( value )
					.autocomplete({
						delay: 0,
						minLength: 0,
						source: function( request, response ) {
							var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
							response( select.children( "option" ).map(function() {
								var text = $( this ).text();
								if ( this.value && ( !request.term || matcher.test(text) ) )
									return {
										label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<strong>$1</strong>" ),
										value: text,
										option: this
									};
							}) );
						},
						select: function( event, ui ) {
							ui.item.option.selected = true;
							self._trigger( "selected", event, {
								item: ui.item.option
							});
						},
						change: function( event, ui ) {
							if ( !ui.item ) {
								var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( $(this).val() ) + "$", "i" ),
									valid = false;
								select.children( "option" ).each(function() {
									if ( $( this ).text().match( matcher ) ) {
										this.selected = valid = true;
										return false;
									}
								});
								if ( !valid ) {
									// remove invalid value, as it didn't match anything
									$( this ).val( "" );
									select.val( "" );
									input.data( "autocomplete" ).term = "";
									return false;
								}
							}
						}
					})
					.addClass( "ui-widget ui-widget-content ui-corner-left" );


                                           // This line added to set default value of the combobox
                                //input.val( $(select).find("option:selected").text());


				input.data( "autocomplete" )._renderItem = function( ul, item ) {
					return $( "<li></li>" )
						.data( "item.autocomplete", item )
						.append( "<a>" + item.label + "</a>" )
						.appendTo( ul );
				};

				this.button = $( "<button type='button'>&nbsp;</button>" )
					.attr( "tabIndex", -1 )
					.attr( "title", "Mostrar todos los items" )
					.insertAfter( input )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						text: false
					})
					.removeClass( "ui-corner-all" )
					.addClass( "ui-corner-right ui-button-icon" )
					.click(function() {
						// close if already visible
						if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
							input.autocomplete( "close" );
							return;
						}

						// work around a bug (likely same cause as #5265)
						$( this ).blur();

						// pass empty string as value to search for, displaying all results
						input.autocomplete( "search", "" );
						input.focus();
					});
			},

			destroy: function() {
				this.input.remove();
				this.button.remove();
				this.element.show();
				$.Widget.prototype.destroy.call( this );
			}
		});
	})( jQuery );

	$(function() {
		$( ".combobox" ).combobox();
		$( "#toggle" ).click(function() {
			$( ".combobox" ).toggle();
		});
	});

	</script>


</head>
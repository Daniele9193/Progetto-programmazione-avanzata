<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<body style="background-color: rgb(52,58,64);">
	<div class="container-fluid">
	<c:url value="/prenotations/save/${prenot.id}" var="action_url" />
	<div class="jumbotron jumbotron-fluid" style="background-color: rgb(52,58,64);">
  		<div class="col-md-6 offset-md-3 col-10 offset-1" style="margin-top: 5em; color: white; background-color:#696969; width: 80%; padding: 2em; border-radius: 1em;">
  		<h2><span class="badge badge-danger">Modifica Prenotazione</span></h2>
  			<div id="div_error" class="alert alert-secondary" role="alert" style="height: 3em; color: black;"><span id="span_error"></span></div>
  			<input hidden ="" id="id_prenotazione" value="${prenot.id}"> 
			<form id="my-form" name='edit' action="${action_url}" method='POST'>    
		         <div class="form-group">
		            <label for="exampleInputEmail1">Nome Evento</label>
		            <label style="font-style:italic; font-size:13px; color:#C0C0C0;"for="exampleInputEmail1">(max 50 caratteri)</label>
		            <input type="text" id="nomeve" class="form-control controllo" name="nome_evento" maxlength="50" value="${prenot.nomeEvento}">
		        </div>
		        <div class="form-group">
		            <label for="exampleInputEmail1">Note</label>
		            <label style="font-style:italic; font-size:13px; color:#C0C0C0;"for="exampleInputEmail1">(max 100 caratteri)</label>
		            <input type="text" id="not" class="form-control controllo" name="note" maxlength="100" value="${prenot.note}">
		        </div> 
		         <div class="form-group">
                <label for="exampleInputEmail1">Quota</label>
				<select class="custom-select controllo" id="quot" name="quota">
                  <option selected>${prenot.aula.quota}</option>
                  <c:forEach items="${quote}" var="q">
                  <option value="${q}">${q}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Nome</label>
				<select class="custom-select" id="aul" name="aula">
                  <option selected>${prenot.aula.nome}</option>
                  <c:forEach items="${nomi}" var="n">
                  <option value="${n}">${n}</option>
                  </c:forEach>
                </select>
              </div>
		         <div class="form-group">
		    		<label for="exampleInputEmail1">Giorno</label>
		    		<input type="Date" id="gio" class="form-control controllo" name="data" value="${formatter_giorno.format(prenot.oraInizio.toDate())}">
		  		</div>
		            <div class="input-group mb-3">
		            	<div class="input-group-prepend">
		                	<label class="input-group-text" for="inputGroupSelect01">Ora Inizio</label>
		                </div>
		                <select class="custom-select controllo" id="inputGroupSelect01" name="ora_inizio">
		                  <option selected>${formatter_ora.format(prenot.oraInizio.toDate())}</option>
		                  <option value="08:30">08:30</option>
		                  <option value="09:30">09:30</option>
		                  <option value="10:30">10:30</option>
		                  <option value="11:30">11:30</option>
		                  <option value="12:30">12:30</option>
		                  <option value="13:30">13:30</option>
		                  <option value="14:30">14:30</option>
		                  <option value="15:30">15:30</option>
		                  <option value="16:30">16:30</option>
		                  <option value="17:30">17:30</option>
		                  <option value="18:30">18:30</option>
		                </select>
		              </div>
		           	<div class="input-group mb-3">
		             	<div class="input-group-prepend">
		                  <label class="input-group-text" for="inputGroupSelect02">Ora Fine</label>
		                </div>
		                <select class="custom-select controllo" id="inputGroupSelect02" name="ora_fine">
		                  <option selected>${formatter_ora.format(prenot.oraFine.toDate())}</option>
		                  <option value="08:30">08:30</option>
		                  <option value="09:30">09:30</option>
		                  <option value="10:30">10:30</option>
		                  <option value="11:30">11:30</option>
		                  <option value="12:30">12:30</option>
		                  <option value="13:30">13:30</option>
		                  <option value="14:30">14:30</option>
		                  <option value="15:30">15:30</option>
		                  <option value="16:30">16:30</option>
		                  <option value="17:30">17:30</option>
		                  <option value="18:30">18:30</option>
		                </select>
		            </div>
		            <button type="submit" class="btn btn-danger" role="button" aria-pressed="true"><i class="far fa-hand-paper"></i> Modifica </button>
		     </form>
		</div>
	</div>
</div>
</body>

<script type="text/javascript">
	$(".controllo").change(function(){
		var form = {
			"id": document.getElementById("id_prenotazione").value, 
			"nome_evento": document.getElementById("nomeve").value,
			"note": document.getElementById("not").value,
			"quota": document.getElementById("quot").value,
			"nome_aula": document.getElementById("aul").value,
			"giorno": document.getElementById("gio").value,
			"oraInizio": document.getElementById("inputGroupSelect01").value,
			"oraFine": document.getElementById("inputGroupSelect02").value,
		}
		console.log(JSON.stringify(form)),
  		 $.ajax({
  			headers: { 
        		'Accept': 'application/json',
        		'Content-Type': 'application/json' 
    		},
            dataType: "text", // and this
  		 	type: 'POST',
            url : '${pageContext.request.contextPath}/prenotations/ajaxtest',
            data: JSON.stringify(form),
            async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
    		cache: false,    //This will force requested pages not to be cached by the browser          
    		processData:false, //To avoid making query String instead of JSON
            success : function(data) {
            	console.log("Data: "+data);
            	//alert(data);
            	if(data == 1) {
                	$("#span_error").text("Aula non trovata");
                	$("#div_error").removeClass('alert-secondary');
                	$("#div_error").removeClass('alert-success');
                	$("#div_error").addClass('alert-danger');
            	}
            	if(data == 2) {
                	$("#span_error").text("Scegliere orario corretto");
                	$("#div_error").removeClass('alert-secondary');
                	$("#div_error").removeClass('alert-success');
                	$("#div_error").addClass('alert-danger');
            	}
            	if(data == 3) {
                	$("#span_error").text("Modifica possibile premi il testo modifica");
                	$("#div_error").removeClass('alert-secondary');
                	$("#div_error").removeClass('alert-danger');
                	$("#div_error").addClass('alert-success');
            	}
            	if(data == 4) {
                	$("#span_error").text("Modifica combacia con prenotazione già esistente");
                	$("#div_error").removeClass('alert-secondary');
                	$("#div_error").removeClass('alert-success');
                	$("#div_error").addClass('alert-danger');
            	}
            	if(data == 6) {
            		$("#span_error").text("Scegli una data successiva ad oggi");
                	$("#div_error").removeClass('alert-secondary');
                	$("#div_error").removeClass('alert-succes');
                	$("#div_error").addClass('alert-danger');
            	}
            },
            error: function(e) {console.log(e);}
        });
	});
</script>
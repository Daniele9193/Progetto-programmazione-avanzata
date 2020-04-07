<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Utente</th>
      <th scope="col">Aula</th>
      <th scope="col">Nome evento</th>
      <th scope="col">Ora inizio</th>
      <th scope="col">Ora fine</th>
      <th scope="col">Note</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${prenotations}" var="p">
    <tr>
      <td>${p.user}</td>
      <td>${p.aula}</td>
      <td>${p.nomeEvento}</td>
      <td>${p.oraInizio}</td>
      <td>${p.oraFine}</td>
      <td>${p.note}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>
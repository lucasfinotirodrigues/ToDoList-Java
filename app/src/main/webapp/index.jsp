<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Hashtable" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Hashtable<Integer, String> tarefas;
    if (session.getAttribute("tarefas") instanceof Hashtable) {
        tarefas = (Hashtable<Integer, String>) session.getAttribute("tarefas");
    } else {
        tarefas = new Hashtable<>();
    }

    tarefas.put(1, "Teste");
    tarefas.put(2, "Teste 2");

    String tarefa = "";
    if (request.getMethod().equals("POST")) {
        tarefa = request.getParameter("tarefa");
    }
    request.setAttribute("tarefa", tarefa);

    session.setAttribute("tarefas", tarefas);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplicação</title>
</head>
<body>
<form action="index.jsp" method="post">
    <input type="text" name="tarefa">
    <button type="submit">Salvar</button>
</form>
<hr>
<!-- ${tarefas} -->
<br/>

<ul>
    <c:forEach var="item" items="${tarefas}">
        <li>${item.value}</li>
    </c:forEach>
</ul>
</body>
</html>

<%@page import="P1.POO.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Inicial</title>
    </head>
    <body>
        <h1>Página Inicial</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Gabriel Ferreira de Oliveira</h2>
        <h2>RA: 1290481913017</h2>
        <h2>Quantidade de disciplinas matriculadas: <%= Disciplinas.getList().size() %> </h2>
    </body>
</html>

<%@page import="P1.POO.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Disciplinas arrayDisciplinas = null;
  
  try{
      arrayDisciplinas = (Disciplinas) application.getAttribute("arrayDisciplinas");
  }catch(Exception e){
  
  }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <h1>Disciplinas</h1>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
                <th>Redefinir Nota</th>
            </tr>
            <% for(int i = 0; i < arrayDisciplinas.getList().size(); i++){ %>
            <tr>
                <td><%= arrayDisciplinas.getList().get(i).getNome() %></td>
                <td><%= arrayDisciplinas.getList().get(i).getEmenta() %></td>
                <td><%= arrayDisciplinas.getList().get(i).getCiclo() %></td>
                <td><%= arrayDisciplinas.getList().get(i).getNota() %></td>
                <td>
                    <form method="post">
                        <input type="number" name="nota" value="0.0">
                        <input type="submit" name="altNota" value="Alterar Nota">
                        <input type="hidden" name="i" value="<%= i %>">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
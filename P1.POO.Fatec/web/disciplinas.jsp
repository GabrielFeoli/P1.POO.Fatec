<%@page import="P1.POO.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Disciplinas arrayDisciplinas = null;
  
  try{
      arrayDisciplinas = (Disciplinas) application.getAttribute("arrayDisciplinas");
  }catch(Exception e){
  
  }
  
  if(request.getParameter("altNota") != null){
      int i = Integer.parseInt(request.getParameter("i"));
      float nota = Float.parseFloat(request.getParameter("nota"));
      
      float notafinal;
      if(nota < 0.0){
          notafinal = 0.0f;
      }else if(nota > 10.0){
          notafinal = 10.0f;
      }else{
          notafinal = nota;
      }
      
      arrayDisciplinas.getList().get(i).setNota(notafinal);
      response.sendRedirect(request.getRequestURI());
      
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
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <%if(request.getParameter("prepararInsert") != null){
            <h3>
        <%}%>
        
        
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
                <th>Controles</th>
            </tr>
            <% for(Disciplinas disc: Disciplinas.getList()){ %>
            <tr>
                <td><%= disc.getNome() %></td>
                <td><%= disc.getEmenta() %></td>
                <td><%= disc.getCiclo() %></td>
                <td><%= disc.getNota() %></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="nome" value="<%= disc.getNome() %>">
                        <input type="hidden" name="ementa" value="<%= disc.getEmenta() %>">
                        <input type="hidden" name="ciclo" value="<%= disc.getCiclo() %>">
                        <input type="hidden" name="nota" value="<%= disc.getNota() %>">
                        <input type="submit" name="prepararUpdate" value="Alterar">
                        <input type="submit" name="prepararDelete" value="Excluir">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </body>
</html>

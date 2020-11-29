<%@page import="P1.POO.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String exceptionMessage = null;
    if(request.getParameter("Cancelar") != null){
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("FormInsert") != null){
        try{
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            float nota = Float.parseFloat(request.getParameter("nota"));
            
            float notafinal;
            if(nota < 0.0){
                notafinal = 0.0f;
            }else if(nota > 10.0){
                notafinal = 10.0f;
            }else{
                notafinal = nota;
            }
            
            Disciplinas.Insert(nome, ementa, ciclo, notafinal);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    
    if(request.getParameter("FormUpdate") != null){
        try{
            String nomeAntigo = request.getParameter("nomeAntigo");
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            float nota = Float.parseFloat(request.getParameter("nota"));
            
            float notafinal;
            if(nota < 0.0){
                notafinal = 0.0f;
            }else if(nota > 10.0){
                notafinal = 10.0f;
            }else{
                notafinal = nota;
            }
            
            Disciplinas.Update(nomeAntigo, nome, ementa, ciclo, notafinal);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    
    if(request.getParameter("FormDelete") != null){
        try{
            String nome = request.getParameter("nomeAntigo");
            
            Disciplinas.Delete(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
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
        
        <% if(exceptionMessage != null){%>
            <div style="color:red"><%= exceptionMessage%></div>
        <%}%>
        
        <% if(request.getParameter("prepararInsert") != null){%>
            <h3>Inserir disciplina</h3>
            <form>
                Nome: <input type="text" name="nome">
                Ementa: <input type="text" name="ementa">
                Ciclo: <input type="text" name="ciclo">
                Nota: <input type="text" name="nota">
                <input type="submit" name="FormInsert" value="Inserir">
                <input type="submit" name="Cancelar" value="Cancelar">
            </form>
        <%}else if(request.getParameter("prepararUpdate") != null){%>
            <h3>Alterar disciplina</h3>
                <form>
                    <% String nome = request.getParameter("nome");%>
                    <% String ementa = request.getParameter("ementa");%>
                    <% String ciclo = request.getParameter("ciclo");%>
                    <% String nota = request.getParameter("nota");%>
                    
                    <input type="hidden" name="nomeAntigo" value="<%= nome %>">
                    Nome: <input type="text" name="nome" value="<%= nome %>">
                    Ementa: <input type="text" name="ementa" value="<%= ementa %>">
                    Ciclo: <input type="text" name="ciclo" value="<%= ciclo %>">
                    Nota: <input type="text" name="nota" value="<%= nota %>">
                    <input type="submit" name="FormUpdate" value="Alterar">
                    <input type="submit" name="Cancelar" value="Cancelar">
                </form>
        <%}else if(request.getParameter("prepararDelete") != null){%>
            <form>
            <% String nome = request.getParameter("nome");%>
            <input type="hidden" name="nomeAntigo" value="<%= nome %>">
                    Excluir a disciplina <b><%= nome %></b>?
                   <input type="submit" name="FormDelete" value="Excluir">
                   <input type="submit" name="Cancelar" value="Cancelar">
            </form>
            <%}else{%>
            <form>
            <input type="submit" name="prepararInsert" value="Inserir">
            </form>
        <%}%>
            
        
        
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
                <th>Comandos</th>
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

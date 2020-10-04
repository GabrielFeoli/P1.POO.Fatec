<%@page import="P1.POO.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Disciplinas arrayDisciplinas = new Disciplinas("","",0);
  
  Disciplinas banco = new Disciplinas("Banco de Dados","Conceitos de Base de Dados. Modelos conceituais de informações. Modelos de Dados: Relacional, Redes e Hierárquicos. Modelagem de dados - conceitual, lógica e física. Teoria relacional: dependências funcionais e multivaloradas, formas normais. Restrições de integridade e de segurança em Banco de Dados Relacional. Sistemas Gerenciadores de Banco de Dados – objetivo e funções. Linguagens de declaração e de manipulação de dados.",4);
  Disciplinas engIII = new Disciplinas("Engenharia de Software III","Conceitos, evolução e importância de arquitetura de software. Padrões de Arquitetura. Padrões de Distribuição. Camadas no desenvolvimento de software. Tipos de Arquitetura de Software. Visões na arquitetura de software. Modelo de Análise e Projetos. Formas de representação. O processo de desenvolvimento. Mapeamento para implementação. Integração do sistema. Testes: planejamento e tipos. Manutenção. Documentação.",4);
  Disciplinas poo = new Disciplinas("Programação Orientada a Objetos","Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças entre o paradigma da programação estruturada em relação à orientação a objetos. Conceito de objeto, classe, métodos, atributos, herança, polimorfismo, agregação, associação, dependência, encapsulamento, mensagem e suas respectivas notações na linguagem padrão de representação da orientação a objetos. Implementação de algoritmos orientado a objetos utilizando linguagens de programação. Aplicação e uso das estruturas fundamentais da orientação a objetos.",4);
  Disciplinas lp4 = new Disciplinas("Linguagem de Programação IV","Comandos de linguagens usadas na construção e estruturação de sites para a Web, com páginas dinâmi¬cas e interativas. Definição de layouts e formatação em geral. Adição de algoritmos usando laços, matrizes, datas, funções e condições. Introdução a Orientação a Objetos utilizando objetos, métodos e propriedades. Integração com Banco de Dados. Exercícios práticos com projeto de criação de sites.",4);
  Disciplinas seg = new Disciplinas("Segurança da Informação","Requisitos de segurança de aplicações, de base de dados e de comunicações. Segurança de dispositivos móveis. Políticas de segurança. Criptografia. Firewalls. Vulnerabilidades e principais tecnologias de segurança.",5);
  Disciplinas soII = new Disciplinas("Sistemas Operacionais II","Apresentação de um sistema operacional específico utilizado em ambiente corporativo. Requisitos de hardware para instalação do sistema. Processo de instalação, personalização, operação, administração e segurança sobre o sistema operacional focado. Elaboração de projetos de seleção e implantação de um sistema operacional.",4);
  Disciplinas met = new Disciplinas("Metodologia da Pesquisa Científico-Tecnológica","O Papel da ciência e da tecnologia. Tipos de conhecimento. Método e técnica. O processo de leitura e de análise textual. Citações e bibliografias. Trabalhos acadêmicos: tipos, características e composição estrutural. O projeto de pesquisa experimental e não-experimental. Pesquisa qualitativa e quantitativa. Apresentação gráfica. Normas da ABNT.",4);

  arrayDisciplinas.addList(banco);
  arrayDisciplinas.addList(engIII);
  arrayDisciplinas.addList(poo);
  arrayDisciplinas.addList(lp4);
  arrayDisciplinas.addList(seg);
  arrayDisciplinas.addList(soII);
  arrayDisciplinas.addList(met);
  
  if(application.getAttribute("arrayDisciplinas") != null){
     application.getAttribute("arrayDisciplinas");
  }else{
     application.setAttribute("arrayDisciplinas",arrayDisciplinas);
  }

%>
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
        <h2>Quantidade de disciplinas matriculadas: </h2>
    </body>
</html>

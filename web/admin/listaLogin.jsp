<%--

    Copyright (c) 2009, 2010 Hércules S. S. José
    

    Este arquivo é parte do programa ClickaFacil.

    ClickaFacil é um software livre; você pode redistribui-lo e/ou 

    modificá-lo dentro dos termos da Licença Pública Geral Menor GNU como 

    publicada pela Fundação do Software Livre (FSF); na versão 2.1 da 

    Licença.
    
    
    Este programa é distribuído na esperança que possa ser util, 

    mas SEM NENHUMA GARANTIA; sem uma garantia implicita de ADEQUAÇÂO a qualquer

    MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral Menor GNU em 
    
    português para maiores detalhes.
    
    
    Você deve ter recebido uma cópia da Licença Pública Geral Menor GNU sob o 

    nome de "LICENSE.TXT" junto com este programa, se não, acesse o site HSlife no 

    endereco www.hslife.com.br ou escreva para a Fundação do Software Livre(FSF) Inc., 

    51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA.
    
    
    Para mais informações sobre o programa ClickaFacil e seus autores acesso o 

    endereço www.hslife.com.br, pelo e-mail contato@hslife.com.br ou escreva para 

    Hércules S. S. José, Av. Ministro Lafaeyte de Andrade, 1683 - Bl. 3 Apt 404, 

    Marco II - Nova Iguaçu, RJ, Brasil.

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="br.com.hslife.clickafacil.javabeans.*"%> 
<%@page import="br.com.hslife.clickafacil.dao.*"%>
<%@page import="br.com.hslife.clickafacil.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Republic
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20090910

-->

<%

            String msg = (String)request.getAttribute("mensagem");

            Login l = (Login) session.getAttribute("userLogado");

            if (l == null) {
                l = new Login();
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
            if (msg == null) {
            	msg = "Olá " + l.getUsuarioLogin() + ", seja bem vindo!";
            }	            

            CategoriaDao daoCat = new CategoriaDao();
            LoginDao daoLog = new LoginDao();

            List<Categoria> categorias = new ArrayList<Categoria>();
            List<Login> logins = new ArrayList<Login>();

            try {
                categorias = daoCat.listarTodos();
                logins = daoLog.listarTodos();
            } catch (Exception e) {
                e.printStackTrace();
            }
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>ClickaFácil</title>
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
        <script type="text/javascript" src="scripts/boxOver.js"></script>
        <script type="text/javascript" src="scripts/util.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="#">ClickaFácil   </a></h1>
                    <p> seu site de pesquisa de preços</p>
                </div>
            </div>
            <!-- end #header -->

            <div id="menu">
                <ul>
                    <li><a href="menuProdutos.jsp">Produtos</a></li>
                    <li><a href="menuLojas.jsp">Loja</a></li>
                    <li><a href="menuFuncionarios.jsp">Funcionários</a></li>
                    <li class="current_page_item"><a href="menuAdmin.jsp">Administração</a></li>

                    <li><a href="menuConfig.jsp">Configurações</a></li>
                    <li><a href="login.jsp?acao=sair">Sair</a></li>
                </ul>
            </div>
            <!-- end #menu -->
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="sidebar">
                            <ul>
                                <li>

                                    <div style="clear: both;"><center><strong><%=msg %></strong></center></div>
                                </li>

                            </ul>
                        </div>
                        <div id="content">
                            <div class="post">
                                <h2 class="title"><a href="#">Gerenciar Logins</a></h2>

                            </div>

                            <div class="post">

                                <!-- Início do Conteúdo -->
                                <table width="100%" border="1">
                                    <tr>
                                        <th width="20%" scope="col"><div align="center">Login</div></th>
                                        <th width="73%" scope="col"><div align="center">Perfil</div></th>


                                        <th width="7%" scope="col"><div align="center">Ativar/Desativar</div></th>
                                    </tr>
                                    <%

                                                for (Login log : logins) {

                                    %>
                                    <tr>
                                        <td align="center"><%=log.getUsuarioLogin()%></td>
                                        <td align="center">
                                            <%
                                                                                                switch (log.getPerfil()) {
                                                                                                    case 1:
                                                                                                        out.print("Administrador do Sistema");
                                                                                                        break;
                                                                                                    case 2:
                                                                                                        out.print("Funcionário da empresa");
                                                                                                        break;
                                                                                                    case 3:
                                                                                                        out.print("Lojista");
                                                                                                        break;
                                                                                                    case 4:
                                                                                                        out.print("Internauta do site");
                                                                                                        break;
                                                                                                }
                                            %>
                                        </td>


                                        <td align="center"><a onclick="return confirmaAtivar()" href="ativaLogin.jsp?acao=ativa&id=<%=log.getIdLogin()%>">
                                                <%
                                                                                                    switch (log.getLoginAtivo()) {
                                                                                                        case 0:
                                                                                                            %>
                                                                                                            <img src="images/star.png" height="16" width="16" border="0"/> Ativar
                                                                                                            <%
                                                                                                            //out.print("Ativar");
                                                                                                            break;
                                                                                                        case 1:
                                                                                                            %>
                                                                                                            <img src="images/excluir.gif" border="0"/> Desativar
                                                                                                            <%
                                                                                                            //out.print("Desativar");
                                                                                                            break;

                                                                                                    }
                                                %>
                                            </a></td>
                                    </tr>
                                    <%
                                                }
                                    %>
                                </table>
                                <br/><br/>
                                <center><a href="menuAdmin.jsp"><< Voltar</a></center>



                                <!-- Fim do conteúdo -->

                            </div>

                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #content -->

                        <!-- end #sidebar -->
                        <div style="clear: both;">&nbsp;</div>
                    </div>

                    <!-- Início do conteúdo do site -->


                    <!-- Fim do conteúdo do site  -->


                </div>
            </div>
            <!-- end #page -->
        </div>
        <div id="footer">
            <p>Copyright (c) 2010 ClickaFácil. Todos os direitos reservados. Template obtido em <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
        </div>
        <!-- end #footer -->
    </body>
</html>
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

            String msg = null;

            Login l = (Login) session.getAttribute("userLogado");

            if (l == null) {
                l = new Login();
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (msg == null) {
            	msg = "Olá " + l.getUsuarioLogin() + ", seja bem vindo!";
            }	 

            CategoriaDao daoCat = new CategoriaDao();
            LojaDao daoLoj = new LojaDao();

            List<Categoria> categorias = new ArrayList<Categoria>();
            List<Loja> lojas = new ArrayList<Loja>();

            try {
                categorias = daoCat.listarTodos();
                lojas = daoLoj.listarTodos();
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Resgata os dados recebidos e salva em sessão
            Login userLogado = (Login) session.getAttribute("userLogado");

            PrecoDao dao = new PrecoDao();
            List<Preco> precos = new ArrayList<Preco>();

            try {
                precos = dao.listarTodos();
            } catch (Exception e) {
                msg = e.getMessage();
                request.setAttribute("mensagem", msg);
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
                    <li class="current_page_item"><a href="menuProdutos.jsp">Produtos</a></li>
                    <li><a href="menuLojas.jsp">Loja</a></li>
                    <li><a href="menuFuncionarios.jsp">Funcionários</a></li>
                    <li><a href="menuAdmin.jsp">Administração</a></li>

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

                                    <div style="clear: both;"><center><strong><%=msg%></strong></center></div>
                                </li>

                            </ul>
                        </div>
                        <div id="content">
                            <div class="post">
                                <h2 class="title"><a href="#">Gerenciar Preços</a></h2>

                            </div>

                            <div class="post">

                                <!-- Início do Conteúdo -->
                                <p align="left"><b><a href="PrecoServlet?acao=cadastrar">Definir preço</a></b></p>
                                <br/>
                                <table width="100%" border="1">
                                    <tr>
                                        <th width="38%" scope="col">Produto</th>
                                        <th width="37%" scope="col">Loja</th>
                                        <th width="14%" scope="col">Valor</th>

                                        <th width="5%" scope="col">Editar</th>
                                        <th width="6%" scope="col">Excluir</th>
                                    </tr>
                                    <%

                                                for (Preco p : precos) {
                                    %>
                                    <tr>
                                        <td><%=p.getIdProduto().getNomeProduto()%></td>
                                        <td><%=p.getIdLoja().getNomeFantasia()%></td>
                                        <td><%=p.getMoedaCorrente()%>&nbsp;<%=p.getValorPreco()%></td>

                                        <td align="center"><a href="PrecoServlet?acao=editar&id=<%=p.getIdPreco()%>"><img src="images/alterar.gif" alt="Editar" border="0"/></a></td>
                                        <td align="center"><a href="PrecoServlet?acao=excluir&id=<%=p.getIdPreco()%>"><img src="images/excluir.gif" alt="Excluir" border="0"/></a></td>
                                    </tr>
                                    <%
                                                }
                                    %>


                                </table>
                                <br/><br/>
                                <center><a href="menuProdutos.jsp"><< Voltar</a></center>
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

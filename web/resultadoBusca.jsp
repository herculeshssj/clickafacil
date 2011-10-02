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

    PrecoDao precoDao = new PrecoDao();
    List<Preco> listaPreco = new ArrayList<Preco>();

    if (request.getAttribute("resultadoBusca") != null) {
        listaPreco = (List<Preco>) request.getAttribute("resultadoBusca");
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
                    <h1><a href="index.jsp">ClickaFácil   </a></h1>
                    <p> seu site de pesquisa de preços</p>
                </div>
            </div>
            <!-- end #header -->
            <div id="menu">
                <ul>
                    <li class="current_page_item"><a href="index.jsp">Início</a></li>
                    <li><a href="produtos.jsp">Produtos</a></li>
                    <li><a href="lojas.jsp">Lojas</a></li>
                    <li><a href="sobre.jsp">Sobre</a></li>

                    <li><a href="contato.jsp">Contato</a></li>
                    <li><a href="admin/">Entrar</a></li>
                </ul>
            </div>
            <!-- end #menu -->
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="content">
                            <div class="post">
                                <h2 class="title"><a href="#">Produtos   </a></h2>

                            </div>
                            <a href="index.jsp">Início</a> > Resultado de busca: <% out.print((String)request.getAttribute("valorBusca")); %>
                            <div class="post">

                                <!-- Início do Conteúdo -->


                                <br/><br/>
                                <table width="940" border="0">
                                    <%
                                                if (listaPreco.size() == 0) {
                                                    out.println("Produto e/ou loja não foi encontrado");
                                                } else {
                                                    for (Preco p : listaPreco) {

                                    %>
                                    <tr>
                                        <td width="96" rowspan="4" align="center"><img src="images/product.jpg"/></td>
                                        <td width="365"><h3><%=p.getIdProduto().getNomeProduto()%></h3></td>
                                        <td width="365"><strong><em>Loja:</em></strong> <%=p.getIdLoja().getNomeFantasia()%></td>
                                        <td width="96" rowspan="4" align="center" valign="middle"><a onClick="MM_openBrWindow('verDetalhes.jsp?cat=<%=p.getIdProduto().getIdProduto()%>','','toolbar=no,location=no,status=no,menubar=no,directories=no,scrollbars=yes,resizable=no,width=975,height=500')" href="#"><img src="images/incluir.gif" alt=">> "/>Mais Detalhes</a></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>Modelo:</strong></em> <%=p.getIdProduto().getModelo()%></td>
                                        <td><strong><%=p.getMoedaCorrente()%> <%=p.getValorPreco()%></strong></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>Fabricante:</strong></em> <%=p.getIdProduto().getFabricante()%></td>
                                        <td><a onclick="MM_openBrWindow('verEndereco.jsp?cat=<%=p.getIdLoja().getIdLoja()%>','','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,directories=no,resizable=no,width=975,height=500')" href="#"><img src="images/visualizar.gif" alt=">> "/>Ver endereço</a></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><a onclick="MM_openBrWindow('verComentarios.jsp?id=<%=p.getIdLoja().getIdLoja()%>','','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,directories=no,resizable=no,width=975,height=500')" href="#"><img src="images/visualizar.gif" alt=">> "/>Ver comentários</a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><hr /></td>
                                    </tr>
                                    <%
                                                    }
                                                }
                                    %>
                                </table>



                                <!-- Fim do conteúdo -->

                            </div>

                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #content -->
                        <div id="sidebar">
                            <ul>
                                <li>
                                    <div id="search" >
                                        <form method="post" action="processaBusca.jsp">
                                            <div>
                                                <input type="text" name="txtBusca" id="txtBusca" value="" />
                                                <input type="submit" id="search-submit" value="OK" /><br/>
                                                <input type="radio" value="Produto" name="rdTipoBusca" checked="checked"/>Produto
                                                <input type="radio" value="Loja" name="rdTipoBusca" />Loja
                                            </div>
                                        </form>
                                    </div>
                                    <div style="clear: both;"></div>
                                </li>
                            </ul>
                        </div>
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

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
            Integer id = 0;
            String nomeLoja = null;

            // Carrega os comentarios do produto selecionado
            if (Util.eNulo(request.getParameter("id"))) {
                id = (Integer) request.getAttribute("id");
                msg = (String)request.getAttribute("msg");
            } else {
                id = new Integer(request.getParameter("id"));
            }


            List<Comentario> listaComentarios = new ArrayList<Comentario>();
            ComentarioDao daoCom = new ComentarioDao();
            LojaDao daoLoja = new LojaDao();

            try {
                listaComentarios = daoCom.listarPorLoja(id);
                nomeLoja = daoLoja.buscarPorId(id).getNomeFantasia(); 
            } catch (Exception e) {
                msg = "Não foi possível carregar as informações do produto";
            }

%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
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
   
            </div>
            <!-- end #menu -->
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="content">
                            <div class="post">
                                <h2 class="title"><a href="login.jsp">Comentários</a></h2>

                            </div>

                            <div class="post">
                            
                            <h3>Loja: <%=nomeLoja %></h3>
                            <br/>

                                <!-- Início do Conteúdo -->

                                <strong><%
                                            if (!Util.eNulo(msg)) {
                                                out.print("<font color=\"#0000FF\">" + msg + "</font>");
                                                //out.print(id);
                                            }

                                    %></strong>
                                    <br/><br/>

                                <%

                                            for (Comentario c : listaComentarios) {

                                %>
                                <strong>Nome: &nbsp;</strong><%=c.getIdInternauta().getNome()%><br/><br/>

                                <strong>Comentado em: &nbsp;</strong><%=c.getDataInclusao()%><br/><br/>

                                <strong>Classificação: &nbsp;</strong>
                                <%

                                                                                switch (c.getClassificacao()) {
                                                                                    case 0:
                                                                                        for (int i=1; i<=1; i++) {
                                                                                        %>
                                                                                        <img src="images/excluir.gif" alt="Fraco" height="16" width="16"/>
                                                                                        <%
                                                                                        }
                                                                                        break;
                                                                                    case 1:
                                                                                        for (int i=1; i<=1; i++) {
                                                                                        %>
                                                                                        <img src="images/star.png" alt="Fraco" height="16" width="16"/>
                                                                                        <%
                                                                                        }                                                                                        
                                                                                        break;
                                                                                    case 2:
                                                                                        for (int i=1; i<=2; i++) {
                                                                                        %>
                                                                                        <img src="images/star.png" alt="Fraco" height="16" width="16"/>
                                                                                        <%
                                                                                        }
                                                                                        break;
                                                                                    case 3:
                                                                                        for (int i=1; i<=3; i++) {
                                                                                        %>
                                                                                        <img src="images/star.png" alt="Fraco" height="16" width="16"/>
                                                                                        <%
                                                                                        }
                                                                                        break;
                                                                                    case 4:
                                                                                        for (int i=1; i<=4; i++) {
                                                                                        %>
                                                                                        <img src="images/star.png" alt="Fraco" height="16" width="16"/>
                                                                                        <%
                                                                                        }
                                                                                        break;
                                                                                    case 5:
                                                                                        for (int i=1; i<=5; i++) {
                                                                                        %>
                                                                                        <img src="images/star.png" alt="Fraco" height="16" width="16"/>
                                                                                        <%
                                                                                        }
                                                                                        break;
                                                                                    case 9:
                                                                                        out.println("Sem classificação");
                                                                                        break;
                                                                                    default:
                                                                                        out.println("Sem classificação");
                                                                                }

                                %><br/><br/>

                                <%=c.getDescricao()%><br/><br/>
                                <hr/>
                                <% }%>
                                <br/>
                                <h3>Insira seu comentário aqui</h3>
                                <br/>


                                <form name="frmComentario" method="post" action="salvaComentario.jsp" onsubmit="return validaFormComentario()">


                                    <strong>* Nome:</strong>
                                    <input type="text" id="txtNome" name="txtNome" maxlength="50" size="37"
                                           /><br/><br/>

                                    <strong>* E-Mail:</strong>
                                    <input type="text" id="txtEmail" name="txtEmail" maxlength="50" size="37"
                                           /><br/><br/>

                                    <strong>Classificação:</strong>
                                    <select name="txtClassificacao" id="txtClassificacao">
                                        <option value="9">Avalie o produto</option>
                                        <option value="0">Ruim</option>
                                        <option value="1">Fraco</option>
                                        <option value="2">Regular</option>
                                        <option value="3">Bom</option>
                                        <option value="4">Ótimo</option>
                                        <option value="5">Excelente</option>

                                    </select><br/><br/>


                                    <strong>Mensagem:</strong>
                                    <textarea class="contact_textarea" id="txtDescricao" name="txtDescricao" cols="30" rows="5"></textarea><br/><br/>


                                    <input type="hidden" name="txtIdLoja" id="txtIdLoja" value="<%=id%>"/>

                                    <input type="submit" name="btnComentar"
                                           value="Comentar" />
                                </form>



                            </div>

                            <!-- Fim do conteúdo -->

                        </div>

                        <div style="clear: both;">&nbsp;</div>
                    </div>
                    <!-- end #content -->
                    <div id="sidebar">

                    </div>
                    <!-- end #sidebar -->
                    <div style="clear: both;">&nbsp;</div>
                </div>

                <!-- Início do conteúdo do site -->


                <!-- Fim do conteúdo do site  -->


            </div>
        </div>
        <!-- end #page -->

        <div id="footer">
            <p>Copyright (c) 2010 ClickaFácil. Todos os direitos reservados. Template obtido em <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
        </div>
        <!-- end #footer -->
    </body>
</html>

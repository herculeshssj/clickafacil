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


            String msg = null;

            // Carrega a lista das categorias e mostra na página
            CategoriaDao daoCat = new CategoriaDao();
            List<Categoria> categorias = new ArrayList<Categoria>();
            try {
                categorias = daoCat.listarTodos();
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Cria um objeto do tipo Login para resgatar os dados da sessão
            Login userLogado = (Login) session.getAttribute("userLogado");


            // Carrega os detalhes da loja selecionada
            int cat = new Integer(request.getParameter("cat"));
            Loja l = new Loja();
            LojaDao daoLoja = new LojaDao();

            try {
                l = daoLoja.buscarPorId(cat);
            } catch (Exception e) {
                msg = "Não foi possível carregar as informações da loja";
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

            </div>
            <!-- end #menu -->
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="content">
                            <div class="post">
                                <h2 class="title"><a href="login.jsp">Detalhes</a></h2>

                            </div>

                            <div class="post">

                                <!-- Início do Conteúdo -->

                                <strong>Loja: &nbsp;</strong><% out.print(l.getNomeFantasia());%><br/><br/>

                                <strong>Endereço: &nbsp;</strong><% out.print(l.getIdInfoAdic().getEndereco());%>, <% out.print(l.getIdInfoAdic().getNumero());%> - <% out.print(l.getIdInfoAdic().getComplemento());%><br/><br/>

                                <strong>Bairro: &nbsp;</strong><% out.print(l.getIdInfoAdic().getBairro());%><br/><br/>

                                <strong>Cidade: &nbsp;</strong><% out.print(l.getIdInfoAdic().getCidade());%> - <% out.print(l.getIdInfoAdic().getEstado());%><br/><br/>

                                <strong>CEP: &nbsp;</strong><% out.print(l.getIdInfoAdic().getCep());%><br/><br/>

                                <strong>Telefone: &nbsp;</strong>(<% out.print(l.getIdInfoAdic().getDdd());%>) &nbsp; <% out.print(l.getIdInfoAdic().getTelefone());%><br/><br/>

                                <strong>Home Page: &nbsp;</strong><% out.print(l.getSite());%><br/><br/>

                                <strong>Mais informações</strong><br/><br/>
                                <% out.print(l.getInformacoes()); %>


                                <!-- Fim do conteúdo -->

                            </div>

                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #content -->
                        <div id="sidebar">
                            <ul>

                                <li>
                                    <!-- Área de anúncios -->

                                    <jsp:include page="anuncios.jsp"/>

                                    <!-- Fim da área de anúncio -->
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

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
            Login l = (Login) request.getAttribute("login");
            Loja j = (Loja) request.getAttribute("loja");
            InfoAdicionais i = (InfoAdicionais) request.getAttribute("info");
            if (Util.eNulo(l) && Util.eNulo(i)) {
                l = new Login();
                j = new Loja();
                i = new InfoAdicionais();
            }

            msg = (String) request.getAttribute("msg");

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
                    <li><a href="index.jsp">Início</a></li>
                    <li><a href="produtos.jsp">Produtos</a></li>
                    <li class="current_page_item"><a href="lojas.jsp">Lojas</a></li>
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
                                <h2 class="title"><a href="#">Cadastro de Lojas   </a></h2>

                            </div>
                            <div class="post">

                                <!-- Início do Conteúdo -->

                                <strong><%

                                            if (Util.eNulo(msg)) {
                                                out.println("É obrigatório o preenchimento de todos os campos<br/>");
                                                out.println("Informe os dados sem acentos e ç");
                                            } else {
                                                out.println("<font color=\"#FF0000\">" + msg + "</font>");
                                            }


                                    %></strong>
                                <br/><br/>


                                <form name="frmCadLoja" method="post" action="salvaLoja.jsp">


                                    <table border="0" cellspacing="5">
                                        <tr>
                                            <td>Nome Fantasia</td>
                                            <td><input name="txtNomeFantasia" type="text" id="txtNomeFantasia"  value="<%=j.getNomeFantasia() %>" size="50" maxlength="100" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>CNPJ</td>
                                            <td><input name="txtCnpj" type="text" id="txtCnpj" value="<%=j.getCnpj() %>" size="20" maxlength="20" class="contact_input2" /> (só números)</td>
                                        </tr>
                                        <tr>
                                            <td>Inscrição Estadual</td>
                                            <td><input name="txtInscricaoEstadual" type="text" id="txtInscricaoEstadual" value="<%=j.getInscricaoEstadual() %>" size="10" maxlength="10" class="contact_input2"/> (só números)</td>
                                        </tr>
                                        <tr>
                                            <td>Site</td>
                                            <td><input name="txtSite" type="text" id="txtSite" value="<%=j.getSite() %>" size="50" maxlength="50" class="contact_input2"/> (com o http://)</td>
                                        </tr>
                                        <tr>
                                            <td>Responsável</td>
                                            <td><input name="txtResponsavel" type="text" id="txtResponsavel" value="<%=j.getResponsavel() %>" size="50" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Razão Social</td>
                                            <td><input name="txtRazaoSocial" type="text" id="txtRazaoSocial" value="<%=i.getNome() %>" size="50" maxlength="100" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>E-Mail</td>
                                            <td><input name="txtEmail" type="text" id="txtEmail" value="<%=i.getEmail() %>" size="30" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Endereço</td>
                                            <td><input name="txtEndereco" type="text" id="txtEndereco" value="<%=i.getEndereco() %>" size="50" maxlength="200" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Número</td>
                                            <td><input name="txtNumero" type="text" id="txtNumero" value="<%=i.getNumero() %>" size="8" maxlength="10" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Complemento</td>
                                            <td><input name="txtComplemento" type="text" id="txtComplemento" value="<%=i.getComplemento() %>" size="25" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Bairro</td>
                                            <td><input name="txtBairro" type="text" id="txtBairro" value="<%=i.getBairro() %>" size="25" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>CEP</td>
                                            <td><input name="txtCep" type="text" id="txtCep" value="<%=i.getCep() %>" size="8" maxlength="8" class="contact_input2"/> (só números)</td>
                                        </tr>
                                        <tr>
                                            <td>Cidade</td>
                                            <td><input name="txtCidade" type="text" id="txtCidade" value="<%=i.getCidade() %>" size="30" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Estado</td>
                                            <td><input name="txtEstado" type="text" id="txtEstado" value="<%=i.getEstado() %>" size="5" maxlength="2" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>DDD</td>
                                            <td><input name="txtDdd" type="text" id="txtDdd" size="5" maxlength="2" value="<%=i.getDdd() %>" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Telefone</td>
                                            <td><input name="txtTelefone" type="text" id="txtTelefone" size="10" maxlength="8" value="<%=i.getTelefone() %>" class="contact_input2"/> (só números)</td>
                                        </tr>
                                        <tr>
                                            <td>Login de acesso</td>
                                            <td><input name="txtLogin" type="text" id="txtLogin" value="<%=l.getUsuarioLogin()%>" size="25" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Senha de acesso</td>
                                            <td><input name="txtSenha" type="password" id="txtSenha" value="" size="25" maxlength="50" class="contact_input2"/></td>
                                        </tr>
                                        <tr>
                                            <td>Confirme a senha</td>
                                            <td><input name="txtConfirmaSenha" type="password" id="txtConfirmaSenha" value="" size="25" maxlength="50" class="contact_input2" /></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" name="btnCadastrar" value="Cadastrar" /></td>
                                        </tr>
                                    </table>

                                </form>

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

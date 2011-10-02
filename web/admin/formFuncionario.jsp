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
			String submit = "";
			String disabled = "";

			Login l = (Login) session.getAttribute("userLogado");

			if (l == null) {
				l = new Login();
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			Funcionario func = (Funcionario) request.getAttribute("func");
			
			if (request.getParameter("acao").equals("salvar")) {
				submit = "processaFuncionario.jsp?acao=salvar";
				if (func == null) {
					func = new Funcionario();
				}				
			}
			
			if (request.getParameter("acao").equals("alterar")) {
				submit = "processaFuncionario.jsp?acao=alterar";
				disabled = "disabled";
			}
				

/*
            String msg = null;

            Login l = (Login) session.getAttribute("userLogado");

            if (l == null) {
                l = new Login();
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            String submit = "processaFuncionario.jsp?acao=salvar";
            String disabled = "";
            Funcionario func = (Funcionario) request.getAttribute("func");
            InfoAdicionais i = (InfoAdicionais) request.getAttribute("info");
            l = (Login) request.getAttribute("login");
            Loja j = (Loja) request.getAttribute("loja");

            if (Util.eNulo(l) && Util.eNulo(i)) {
                l = new Login();
                j = new Loja();
                i = new InfoAdicionais();
            }
            
            if (func == null) {
                func = new Funcionario();
                //c.setNomeCategoria("");
                //c.setDescricao("");
            } else {
                submit = "processaFuncionario.jsp?acao=alterar";
                disabled = "disabled";
            }
            
            
            msg = (String) request.getAttribute("msg");
            
            */
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
                    <li class="current_page_item"><a href="menuFuncionarios.jsp">Funcionários</a></li>
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
                                    <!-- Área de mensagens   -->

                                    <center><strong>
                                            <%
                                                        msg = (String) request.getAttribute("mensagem");
                                                        if (msg != null) {
                                                            out.print(msg);
                                                        } else {
                                                            out.print("Olá "+ l.getUsuarioLogin()+ ", seja bem vindo.");
                                                        }
                                            %>
                                        </strong></center>
                                    <!-- Fim da área de mensagens -->
                                </li>

                            </ul>
                        </div>
                        <div id="content">
                            <div class="post">
                                <h2 class="title"><a href="#">Cadastrar Funcionário</a></h2>

                            </div>

                            <div class="post">

                                <!-- Início do Conteúdo -->
                                <center>

                                    <form name="frmLogin" method="post" action="<%=submit%>">
                                        <table border="0" cellspacing="5">

                                            <tr>
                                                <td><div align="left"><strong>Nome:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtNome" type="text" id="txtNome" value="<%=func.getIdInfoAdic().getNome()%>" size="50" maxlength="100" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>CPF</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtCpf" type="text" id="txtCpf" value="<%=func.getCpf()%>" size="15" maxlength="15" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Função:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtFuncao" type="text" id="txtFuncao" value="<%=func.getFuncao()%>" size="50" maxlength="100" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Matrícula:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtMatricula" type="text" id="txtMatricula" value="<%=func.getMatricula()%>" size="5" maxlength="5" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>E-Mail:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtEmail" type="text" id="txtEmail" value="<%=func.getIdInfoAdic().getEmail()%>" size="30" maxlength="50" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Endereço:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtEndereco" type="text" id="txtEndereco" value="<%=func.getIdInfoAdic().getEndereco()%>" size="50" maxlength="200" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Número:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtNumero" type="text" id="txtNumero" value="<%=func.getIdInfoAdic().getNumero()%>" size="8" maxlength="10" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Complemento:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtComplemento" type="text" id="txtComplemento" value="<%=func.getIdInfoAdic().getComplemento()%>" size="25" maxlength="50" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Bairro:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtBairro" type="text" id="txtBairro" value="<%=func.getIdInfoAdic().getBairro()%>" size="25" maxlength="50" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>CEP:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtCep" type="text" id="txtCep" value="<%=func.getIdInfoAdic().getCep()%>" size="8" maxlength="8" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Cidade:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtCidade" type="text" id="txtCidade" value="<%=func.getIdInfoAdic().getCidade()%>" size="30" maxlength="50" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Estado:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtEstado" type="text" id="txtEstado" value="<%=func.getIdInfoAdic().getEstado()%>" size="5" maxlength="2" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>DDD:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtDdd" type="text" class="contact_input2" id="txtDdd" value="<%=func.getIdInfoAdic().getDdd()%>" size="5" maxlength="2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Telefone:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtTelefone" type="text" class="contact_input2" id="txtTelefone" value="<%=func.getIdInfoAdic().getTelefone()%>" size="10" maxlength="8"/>
                                                </div></td>
                                            </tr>

                                            <tr>
                                                <td><div align="left"><strong>Login de acesso:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtLogin" type="text" class="contact_input2" id="txtLogin" value="" size="25" maxlength="50" <%=disabled %>/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Senha:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtSenha" type="password" class="contact_input2" id="txtSenha" value="" size="25" maxlength="50" <%=disabled %>/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"><strong>Confirma senha:</strong></div></td>
                                                <td><div align="left">
                                                  <input name="txtConfirmaSenha" type="password" class="contact_input2" id="txtConfirmaSenha" value="" size="25" maxlength="50" <%=disabled %>/>
                                                </div></td>
                                            </tr>


                                            <tr>
                                                <td><div align="left"></div></td>
                                                <td><div align="left">
                                                  <input name="txtIdLoja" type="hidden" id="txtIdLoja" value="<%=func.getIdFuncionario()%>" size="25" maxlength="50" class="contact_input2"/>
                                                  <input name="txtIdInfoAdic" type="hidden" id="txtIdInfoAdic" value="<%=func.getIdInfoAdic().getIdInfoAdic() %>" size="25" maxlength="50" class="contact_input2"/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><div align="left"></div></td>
                                                <td><div align="left">
                                                  <input type="submit" name="btnSalvar" value="Salvar" />
                                                </div></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <br/>
                                    <p><a href="listaFuncionario.jsp"><< Voltar</a></p>
                                </center>
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

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
<%

        response.setContentType("text/html;charset=ISO-8859-1");
        String msg = null;
        Funcionario func = null;
        Login log = null;
        InfoAdicionais info = null;

        FuncionarioDao daoFunc = new FuncionarioDao();
        LoginDao daoLog = new LoginDao();
        InfoAdicionaisDao daoInfo = new InfoAdicionaisDao();

        // Redireciona para o formulÃ¡rio para realizar o cadastro
        if (request.getParameter("acao").equals("cadastrar")) {
            request.getRequestDispatcher("formFuncionario.jsp?acao=salvar").forward(request, response);
        }


        // Salva os dados preenchidos no formulÃ¡rio
        if (request.getParameter("acao").equals("salvar")) {

        	// AtribuiÃ§Ã£o dos objetos            
            String confirmaSenha = "";
            func = new Funcionario();
            log = new Login();
            info = new InfoAdicionais();
            String matricula = "";

            // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Funcionario
            func.setCpf(request.getParameter("txtCpf"));
            func.setFuncao(request.getParameter("txtFuncao"));
            matricula = request.getParameter("txtMatricula");
            
         // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para InfoAdicionais
            info.setBairro(request.getParameter("txtBairro"));
            info.setCep(request.getParameter("txtCep"));
            info.setCidade(request.getParameter("txtCidade"));
            info.setComplemento(request.getParameter("txtComplemento"));
            info.setDdd(request.getParameter("txtDdd"));
            info.setEmail(request.getParameter("txtEmail"));
            info.setEndereco(request.getParameter("txtEndereco"));
            info.setEstado(request.getParameter("txtEstado"));
            info.setNumero(request.getParameter("txtNumero"));
            info.setNome(request.getParameter("txtNome"));
            info.setTelefone(request.getParameter("txtTelefone"));
            
         // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Login
            log.setSenhaLogin(request.getParameter("txtSenha"));
            log.setUsuarioLogin(request.getParameter("txtLogin"));
            confirmaSenha = request.getParameter("txtConfirmaSenha");
            
         // Verificando os dados vindo do formulÃ¡rio

            // Verificando as informaÃ§Ãµes da loja
            if (Util.eVazio(func.getCpf())) {
                msg = "Informe o CPF do funcionário";
            } else if (Util.eVazio(func.getFuncao())) {
                msg = "Informe o função do funcionário";
            } else if (Util.eVazio(matricula)) {
                msg = "Informe a matrícula do funcionário";            
            } else if (Util.eVazio(info.getNome())) {
                msg = "Informe o nome do funcionário";
            } else if (Util.eVazio(info.getEmail())) {
                msg = "Informe o e-mail";
            } else if (Util.eVazio(info.getEndereco())) {
                msg = "Informe o endereço";
            } else if (Util.eVazio(info.getBairro())) {
                msg = "Informe o bairro";
            } else if (Util.eVazio(info.getCep())) {
                msg = "Informe o CEP";
            } else if (Util.eVazio(info.getCidade())) {
                msg = "Informe a cidade";
            } else if (Util.eVazio(info.getEstado())) {
                msg = "Informe o estado";
            } else if (Util.eVazio(info.getDdd())) {
                msg = "Informe o DDD";
            } else if (Util.eVazio(info.getTelefone())) {
                msg = "Informe o telefone";
            } else if (!Util.validaEmail(info.getEmail())) {
                msg = "E-Mail informado não é válido!";
            } else if (!Util.soNumeros(func.getCpf()) && !Util.soNumeros(matricula) && !Util.soNumeros(info.getCep()) && !Util.soNumeros(info.getDdd()) && !Util.soNumeros(info.getTelefone())) {
                msg = "Campos 'CPF', 'Matrícula', CEP', 'DDD' e 'Telefone' só aceitam números";
            } else if (!Util.soLetras(info.getEstado())) {
                msg = "Campo 'Estado' só aceita letras";
            } else if (!Util.validaCpf(func.getCpf())) {
                msg = "CPF informado não é válido ";
            } else if (Util.eVazio(log.getUsuarioLogin())) {
                msg = "Informe o login de acesso";
            } else if (Util.eVazio(log.getSenhaLogin())) {
                msg = "Informe a senha de acesso";
            } else if (Util.eVazio(confirmaSenha)) {
                msg = "Confirme a senha de acesso";
            } else if (!log.getSenhaLogin().equals(confirmaSenha)) {
                msg = "Senhas não coincidem!";
            } else {
                // Atribui os outros valores e salva o registro

                try {
                    if (daoFunc.matriculaExiste(matricula)) {
                        msg = "Matrícula informada já existe!";
                    } else if (daoFunc.cpfExiste(func.getCpf())) {
                        msg = "CPF informado já existe!";
                    } else if (daoInfo.emailExiste(info.getEmail())) {
                        msg = "E-Mail informada já existe. Informe outro e-mail.";
                    } else if (daoLog.loginExiste(log.getUsuarioLogin())) {
                        msg = "Login informado já existe!";
                    } else {
                    	func.setMatricula((new Integer(matricula)));
                        log.setLoginAtivo(0);
                        log.setPerfil(2);
                        log.setSenhaLogin(Util.criptografar(log.getSenhaLogin()));
                        daoFunc.salvar(func, log, info);                        
                        msg = "Cadastro realizado com sucesso!";
                        request.setAttribute("mensagem", msg);
                        request.getRequestDispatcher("formFuncionario.jsp").forward(request, response);
                    }
                } catch (Exception e) {
                    msg = "Não foi possível realizar o cadastro.";                    
                }
            }            
         	
         	func.setIdInfoAdic(info);
         	func.setLogin(log);
            request.setAttribute("func", func);
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("formFuncionario.jsp?acao=salvar").forward(request, response);

        }

        // Carrega os dados para o formulÃ¡rio para alterar
        if (request.getParameter("acao").equals("editar")) {
            func = new Funcionario();
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                func = daoFunc.buscarPorId(id);
            } catch (Exception e) {
                //e.printStackTrace();
                msg = e.getMessage();
                request.setAttribute("mensagem", msg);
                request.getRequestDispatcher("listaFuncionario.jsp").forward(request, response);
            }
            request.setAttribute("func", func);
            request.getRequestDispatcher("formFuncionario.jsp?acao=alterar").forward(request, response);

        }

        if (request.getParameter("acao").equals("alterar")) {

        	// AtribuiÃ§Ã£o dos objetos            
            func = new Funcionario();            
            info = new InfoAdicionais();
            String matricula = "";

            // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Funcionario
            func.setCpf(request.getParameter("txtCpf"));
            func.setFuncao(request.getParameter("txtFuncao"));
            matricula = request.getParameter("txtMatricula");
            
         // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para InfoAdicionais
            info.setBairro(request.getParameter("txtBairro"));
            info.setCep(request.getParameter("txtCep"));
            info.setCidade(request.getParameter("txtCidade"));
            info.setComplemento(request.getParameter("txtComplemento"));
            info.setDdd(request.getParameter("txtDdd"));
            info.setEmail(request.getParameter("txtEmail"));
            info.setEndereco(request.getParameter("txtEndereco"));
            info.setEstado(request.getParameter("txtEstado"));
            info.setNumero(request.getParameter("txtNumero"));
            info.setNome(request.getParameter("txtNome"));
            info.setTelefone(request.getParameter("txtTelefone"));
            info.setIdInfoAdic(new Integer(request.getParameter("txtIdInfoAdic")));
            
         // Verificando os dados vindo do formulÃ¡rio

            // Verificando as informaÃ§Ãµes da loja
            if (Util.eVazio(func.getCpf())) {
                msg = "Informe o CPF do funcionário";
            } else if (Util.eVazio(func.getFuncao())) {
                msg = "Informe o função do funcionário";
            } else if (Util.eVazio(matricula)) {
                msg = "Informe a matrícula do funcionário";            
            } else if (Util.eVazio(info.getNome())) {
                msg = "Informe o nome do funcionário";
            } else if (Util.eVazio(info.getEmail())) {
                msg = "Informe o e-mail";
            } else if (Util.eVazio(info.getEndereco())) {
                msg = "Informe o endereço";
            } else if (Util.eVazio(info.getBairro())) {
                msg = "Informe o bairro";
            } else if (Util.eVazio(info.getCep())) {
                msg = "Informe o CEP";
            } else if (Util.eVazio(info.getCidade())) {
                msg = "Informe a cidade";
            } else if (Util.eVazio(info.getEstado())) {
                msg = "Informe o estado";
            } else if (Util.eVazio(info.getDdd())) {
                msg = "Informe o DDD";
            } else if (Util.eVazio(info.getTelefone())) {
                msg = "Informe o telefone";
            } else if (!Util.validaEmail(info.getEmail())) {
                msg = "E-Mail informado não é válido!";
            } else if (!Util.soNumeros(func.getCpf()) && !Util.soNumeros(matricula) && !Util.soNumeros(info.getCep()) && !Util.soNumeros(info.getDdd()) && !Util.soNumeros(info.getTelefone())) {
                msg = "Campos 'CPF', 'Matrícula', CEP', 'DDD' e 'Telefone' só aceitam números";
            } else if (!Util.soLetras(info.getEstado())) {
                msg = "Campo 'Estado' só aceita letras";
            } else if (!Util.validaCpf(func.getCpf())) {
                msg = "CPF informado não é válido ";                        
            } else {
            	try {
            		func.setIdInfoAdic(info);
            		func.setMatricula(new Integer(matricula));
            		daoFunc.alterar(func);
                    msg = "Alteração realizada com sucesso!";
                    request.setAttribute("mensagem", msg);
                    request.getRequestDispatcher("listaFuncionario.jsp").forward(request, response);
            	} catch (Exception e) {
            		msg = "Não foi possível alterar o registro.";    
            	}
            }
                 	
         	func.setIdInfoAdic(info);
         	func.setLogin(log);
            request.setAttribute("func", func);
            request.setAttribute("mensagem", msg);
            if (!response.isCommitted()) {
            	request.getRequestDispatcher("formFuncionario.jsp?acao=alterar").forward(request, response);
                }
            
        }

        // Exclui o registro selecionado
        if (request.getParameter("acao").equals("excluir")) {
            func = new Funcionario();
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                func = daoFunc.buscarPorId(id);
                daoFunc.excluir(func);
                msg = "Registro apagado com sucesso";
            } catch (Exception e) {
                msg = e.getMessage();
            }
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("listaFuncionario.jsp").forward(request, response);
        }

 %>
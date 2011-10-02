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

<%@page import="br.com.hslife.clickafacil.javabeans.*"%> 
<%@page import="br.com.hslife.clickafacil.dao.*"%>
<%@page import="br.com.hslife.clickafacil.util.*" %>
<%@page import="java.util.*" %>

<%


        response.setContentType("text/html;charset=ISO-8859-1");

        // AtribuiÃ§Ã£o dos objetos
        String msg = null;
        String confirmaSenha = "";
        Loja loj = new Loja();
        Login log = new Login();
        InfoAdicionais info = new InfoAdicionais();

        LojaDao daoLoj = new LojaDao();
        LoginDao daoLog = new LoginDao();
        InfoAdicionaisDao daoInfo = new InfoAdicionaisDao();

        // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Loja
        loj.setCnpj(request.getParameter("txtCnpj"));
        loj.setInscricaoEstadual(request.getParameter("txtInscricaoEstadual"));
        loj.setNomeFantasia(request.getParameter("txtNomeFantasia"));
        loj.setResponsavel(request.getParameter("txtResponsavel"));
        loj.setSite(request.getParameter("txtSite"));

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
        info.setNome(request.getParameter("txtRazaoSocial"));
        info.setTelefone(request.getParameter("txtTelefone"));


        // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Login
        log.setSenhaLogin(request.getParameter("txtSenha"));
        log.setUsuarioLogin(request.getParameter("txtLogin"));
        confirmaSenha = request.getParameter("txtConfirmaSenha");

        // Verificando os dados vindo do formulÃ¡rio

        // Verificando as informaÃ§Ãµes da loja
        if (Util.eVazio(loj.getNomeFantasia())) {
            msg = "Informe o nome da loja";
        } else if (Util.eVazio(loj.getCnpj())) {
            msg = "Informe o CNPJ";
        } else if (Util.eVazio(loj.getInscricaoEstadual())) {
            msg = "Informe a inscrição estadual";
        } else if (Util.eVazio(loj.getResponsavel())) {
            msg = "Informe o nome do responsável da loja";
        } else if (Util.eVazio(info.getNome())) {
            msg = "Informe a razão social";
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
        } else if (!Util.soNumeros(loj.getCnpj()) && !Util.soNumeros(loj.getInscricaoEstadual()) && !Util.soNumeros(info.getCep()) && !Util.soNumeros(info.getDdd()) && !Util.soNumeros(info.getTelefone())) {
            msg = "Campos 'CNPJ', 'Inscrição Estadual', CEP', 'DDD' e 'Telefone' só aceitam números";
        } else if (!Util.soLetras(info.getEstado())) {
            msg = "Campo 'Estado' só aceita letras";
        } else if (!Util.validaCnpj(loj.getCnpj())) {
            msg = "CNPJ informado não é válido ";
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

            // Login


            try {
                if (daoLoj.inscricaoExiste(loj.getInscricaoEstadual())) {
                    msg = "Inscrição Estadual informada já existe!";
                } else if (daoLoj.cnpjExiste(loj.getCnpj())) {
                    msg = "CNPJ informado já existe!";
                } else if (daoInfo.emailExiste(info.getEmail())) {
                    msg = "E-Mail informada já existe. Informe outro e-mail.";
                } else if (daoLog.loginExiste(log.getUsuarioLogin())) {
                    msg = "Login informado já existe!";
                } else {
                    log.setLoginAtivo(0);
                    log.setPerfil(3);
                    log.setSenhaLogin(Util.criptografar(log.getSenhaLogin()));
                    daoLoj.salvar(loj, log, info);
                    msg = "Cadastro realizado com sucesso!<br/><br/>";
                    msg = msg + "Em alguns minutos você receberá um e-mail de confirmação dos dados.";
                    EnviaEmail mail = new EnviaEmail();
                    mail.enviar("herculeshssj@gmail.com", info.getEmail(), "Cadastro do ClickaFacil", "Seu cadastro foi realizado com sucesso no ClickaFacil. Entre em contato com a equipe do ClickaFacil para podermos ativar seu login de acesso.");
                    request.setAttribute("msgSucesso", msg);
                    request.getRequestDispatcher("sucesso.jsp").forward(request, response);
                }
            } catch (Exception e) {
                msg = "Não foi possível realizar o cadastro. Tente novamente mais tarde.";
                request.setAttribute("msgErro", msg);
                request.getRequestDispatcher("erro.jsp").forward(request, response);
            }



        }

        request.setAttribute("loja", loj);
        request.setAttribute("login", log);
        request.setAttribute("info", info);
        request.setAttribute("msg", msg);
        if (!response.isCommitted()) {
        request.getRequestDispatcher("cadLoja.jsp").forward(request, response);
        }



%>
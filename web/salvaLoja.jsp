<%--

    Copyright (c) 2009, 2010 H�rcules S. S. Jos�
    

    Este arquivo � parte do programa ClickaFacil.

    ClickaFacil � um software livre; voc� pode redistribui-lo e/ou 

    modific�-lo dentro dos termos da Licen�a P�blica Geral Menor GNU como 

    publicada pela Funda��o do Software Livre (FSF); na vers�o 2.1 da 

    Licen�a.
    
    
    Este programa � distribu�do na esperan�a que possa ser util, 

    mas SEM NENHUMA GARANTIA; sem uma garantia implicita de ADEQUA��O a qualquer

    MERCADO ou APLICA��O EM PARTICULAR. Veja a Licen�a P�blica Geral Menor GNU em 
    
    portugu�s para maiores detalhes.
    
    
    Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor GNU sob o 

    nome de "LICENSE.TXT" junto com este programa, se n�o, acesse o site HSlife no 

    endereco www.hslife.com.br ou escreva para a Funda��o do Software Livre(FSF) Inc., 

    51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA.
    
    
    Para mais informa��es sobre o programa ClickaFacil e seus autores acesso o 

    endere�o www.hslife.com.br, pelo e-mail contato@hslife.com.br ou escreva para 

    H�rcules S. S. Jos�, Av. Ministro Lafaeyte de Andrade, 1683 - Bl. 3 Apt 404, 

    Marco II - Nova Igua�u, RJ, Brasil.

--%>

<%@page import="br.com.hslife.clickafacil.javabeans.*"%> 
<%@page import="br.com.hslife.clickafacil.dao.*"%>
<%@page import="br.com.hslife.clickafacil.util.*" %>
<%@page import="java.util.*" %>

<%


        response.setContentType("text/html;charset=ISO-8859-1");

        // Atribuição dos objetos
        String msg = null;
        String confirmaSenha = "";
        Loja loj = new Loja();
        Login log = new Login();
        InfoAdicionais info = new InfoAdicionais();

        LojaDao daoLoj = new LojaDao();
        LoginDao daoLog = new LoginDao();
        InfoAdicionaisDao daoInfo = new InfoAdicionaisDao();

        // Atribuição dos valores vindos do formulário para Loja
        loj.setCnpj(request.getParameter("txtCnpj"));
        loj.setInscricaoEstadual(request.getParameter("txtInscricaoEstadual"));
        loj.setNomeFantasia(request.getParameter("txtNomeFantasia"));
        loj.setResponsavel(request.getParameter("txtResponsavel"));
        loj.setSite(request.getParameter("txtSite"));

        // Atribuição dos valores vindos do formulário para InfoAdicionais
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


        // Atribuição dos valores vindos do formulário para Login
        log.setSenhaLogin(request.getParameter("txtSenha"));
        log.setUsuarioLogin(request.getParameter("txtLogin"));
        confirmaSenha = request.getParameter("txtConfirmaSenha");

        // Verificando os dados vindo do formulário

        // Verificando as informações da loja
        if (Util.eVazio(loj.getNomeFantasia())) {
            msg = "Informe o nome da loja";
        } else if (Util.eVazio(loj.getCnpj())) {
            msg = "Informe o CNPJ";
        } else if (Util.eVazio(loj.getInscricaoEstadual())) {
            msg = "Informe a inscri��o estadual";
        } else if (Util.eVazio(loj.getResponsavel())) {
            msg = "Informe o nome do respons�vel da loja";
        } else if (Util.eVazio(info.getNome())) {
            msg = "Informe a raz�o social";
        } else if (Util.eVazio(info.getEmail())) {
            msg = "Informe o e-mail";
        } else if (Util.eVazio(info.getEndereco())) {
            msg = "Informe o endere�o";
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
            msg = "E-Mail informado n�o � v�lido!";
        } else if (!Util.soNumeros(loj.getCnpj()) && !Util.soNumeros(loj.getInscricaoEstadual()) && !Util.soNumeros(info.getCep()) && !Util.soNumeros(info.getDdd()) && !Util.soNumeros(info.getTelefone())) {
            msg = "Campos 'CNPJ', 'Inscri��o Estadual', CEP', 'DDD' e 'Telefone' s� aceitam n�meros";
        } else if (!Util.soLetras(info.getEstado())) {
            msg = "Campo 'Estado' s� aceita letras";
        } else if (!Util.validaCnpj(loj.getCnpj())) {
            msg = "CNPJ informado n�o � v�lido ";
        } else if (Util.eVazio(log.getUsuarioLogin())) {
            msg = "Informe o login de acesso";
        } else if (Util.eVazio(log.getSenhaLogin())) {
            msg = "Informe a senha de acesso";
        } else if (Util.eVazio(confirmaSenha)) {
            msg = "Confirme a senha de acesso";
        } else if (!log.getSenhaLogin().equals(confirmaSenha)) {
            msg = "Senhas n�o coincidem!";
        } else {
            // Atribui os outros valores e salva o registro

            // Login


            try {
                if (daoLoj.inscricaoExiste(loj.getInscricaoEstadual())) {
                    msg = "Inscri��o Estadual informada j� existe!";
                } else if (daoLoj.cnpjExiste(loj.getCnpj())) {
                    msg = "CNPJ informado j� existe!";
                } else if (daoInfo.emailExiste(info.getEmail())) {
                    msg = "E-Mail informada j� existe. Informe outro e-mail.";
                } else if (daoLog.loginExiste(log.getUsuarioLogin())) {
                    msg = "Login informado j� existe!";
                } else {
                    log.setLoginAtivo(0);
                    log.setPerfil(3);
                    log.setSenhaLogin(Util.criptografar(log.getSenhaLogin()));
                    daoLoj.salvar(loj, log, info);
                    msg = "Cadastro realizado com sucesso!<br/><br/>";
                    msg = msg + "Em alguns minutos voc� receber� um e-mail de confirma��o dos dados.";
                    EnviaEmail mail = new EnviaEmail();
                    mail.enviar("herculeshssj@gmail.com", info.getEmail(), "Cadastro do ClickaFacil", "Seu cadastro foi realizado com sucesso no ClickaFacil. Entre em contato com a equipe do ClickaFacil para podermos ativar seu login de acesso.");
                    request.setAttribute("msgSucesso", msg);
                    request.getRequestDispatcher("sucesso.jsp").forward(request, response);
                }
            } catch (Exception e) {
                msg = "N�o foi poss�vel realizar o cadastro. Tente novamente mais tarde.";
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
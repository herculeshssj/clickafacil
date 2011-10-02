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
        Loja loj = new Loja();
        Login log = new Login();
        InfoAdicionais info = new InfoAdicionais();

        LojaDao daoLoj = new LojaDao();
        LoginDao daoLog = new LoginDao();
        InfoAdicionaisDao daoInfo = new InfoAdicionaisDao();


        // Carrega os dados para o formulÃ¡rio para alterar
        if (request.getParameter("acao").equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                loj = daoLoj.buscarPorId(id);
            } catch (Exception e) {
                msg = e.getMessage();
                request.setAttribute("mensagem", msg);
                request.getRequestDispatcher("listaLoja.jsp").forward(request, response);
            }
            request.setAttribute("loj", loj);
            request.getRequestDispatcher("formLoja.jsp").forward(request, response);
        }

        // Recebe os dados do formulÃ¡rio e salva no banco de dados
        if (request.getParameter("acao").equals("alterar")) {
        	response.setContentType("text/html;charset=ISO-8859-1");
            

            // AtribuiÃ§Ã£o dos objetos
           
            String confirmaSenha = "";
            loj = new Loja();
            log = new Login();
            info = new InfoAdicionais();

            daoLoj = new LojaDao();
            daoLog = new LoginDao();
            daoInfo = new InfoAdicionaisDao();

            // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Loja
            loj.setIdLoja(new Integer(request.getParameter("txtIdLoja")));
            loj.setCnpj(request.getParameter("txtCnpj"));
            loj.setInscricaoEstadual(request.getParameter("txtInscricaoEstadual"));
            loj.setNomeFantasia(request.getParameter("txtNomeFantasia"));
            loj.setResponsavel(request.getParameter("txtResponsavel"));
            loj.setSite(request.getParameter("txtSite"));

            // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para InfoAdicionais
            info.setIdInfoAdic(new Integer(request.getParameter("txtIdInfoAdic")));
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

            // Verificando os dados vindo do formulÃ¡rio

            // Verificando as informaÃ§Ãµes da loja
            if (Util.eVazio(loj.getNomeFantasia())) {
                msg = "Informe o nome da loja";
            } else if (Util.eVazio(loj.getCnpj())) {
                msg = "Informe o CNPJ";
            } else if (Util.eVazio(loj.getInscricaoEstadual())) {
                msg = "Informe a inscriÃ§Ã£o estadual";
            } else if (Util.eVazio(loj.getResponsavel())) {
                msg = "Informe o nome do responsÃ¡vel da loja";
            } else if (Util.eVazio(info.getNome())) {
                msg = "Informe a razÃ£o social";
            } else if (Util.eVazio(info.getEmail())) {
                msg = "Informe o e-mail";
            } else if (Util.eVazio(info.getEndereco())) {
                msg = "Informe o endereÃ§o";
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
                msg = "E-Mail informado nÃ£o Ã© vÃ¡lido!";
            } else if (!Util.soNumeros(loj.getCnpj()) && !Util.soNumeros(loj.getInscricaoEstadual()) && !Util.soNumeros(info.getCep()) && !Util.soNumeros(info.getDdd()) && !Util.soNumeros(info.getTelefone())) {
                msg = "Campos 'CNPJ', 'InscriÃ§Ã£o Estadual', CEP', 'DDD' e 'Telefone' sÃ³ aceitam nÃºmeros";
            } else if (!Util.soLetras(info.getEstado())) {
                msg = "Campo 'Estado' sÃ³ aceita letras";
            } else if (!Util.validaCnpj(loj.getCnpj())) {
                msg = "CNPJ informado nÃ£o Ã© vÃ¡lido ";
            } else {
                // Atribui os outros valores e salva o registro

                try {
                    if (daoLoj.inscricaoExiste(loj.getInscricaoEstadual()) && daoLoj.buscarPorId(loj.getIdLoja()) == null) {
                        msg = "InscriÃ§Ã£o Estadual informada jÃ¡ existe!";
                    } else if (daoLoj.cnpjExiste(loj.getCnpj()) && daoLoj.buscarPorId(loj.getIdLoja()) == null) {
                        msg = "CNPJ informado jÃ¡ existe!";
                    } else {
                        daoLoj.alterar(loj, info);
                        msg = "Cadastro atualizado com sucesso!";
                        request.setAttribute("mensagem", msg);
                        request.getRequestDispatcher("listaLoja.jsp").forward(request, response);
                    }
                } catch (Exception e) {
                    msg = "NÃ£o foi possÃ­vel atualizar o cadastro.<br/>";
                    msg = msg + e.getMessage();
                    request.setAttribute("mensagem", msg);
                    request.getRequestDispatcher("listaLoja.jsp").forward(request, response);
                }

            }

            loj.setIdInfoAdic(info);
            request.setAttribute("loj", loj);
            request.setAttribute("mensagem", msg);
            if (!response.isCommitted()) {
                request.getRequestDispatcher("formLoja.jsp").forward(request, response);
            }
        }

        /*
        if (request.getParameter("acao").equals("alterar")) {



        int id = Integer.parseInt(request.getParameter("txtIdLoja"));

        try {
        loj = daoLoj.buscarPorId(id);

        // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para InfoAdicionais
        // na classe Loja


        info.setIdInfoAdic(loj.getIdInfoAdic().getIdInfoAdic());
        info.setBairro(request.getParameter("txtBairro"));
        info.setCep(request.getParameter("txtCep"));
        info.setCidade(request.getParameter("txtCidade"));
        info.setComplemento(request.getParameter("txtComplemento"));
        info.setDdd(request.getParameter("txtDdd"));
        info.setEmail(request.getParameter("txtEmail"));
        info.setEndereco(request.getParameter("txtEndereco"));
        info.setEstado(request.getParameter("txtEstado"));
        info.setNome(request.getParameter("txtRazaoSocial"));
        info.setNumero(request.getParameter("txtNumero"));
        info.setTelefone(request.getParameter("txtTelefone"));


        // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio para Loja
        //loj.setCnpj(request.getParameter("txtCnpj"));
        //loj.setInscricaoEstadual(request.getParameter("txtInscricaoEstadual"));
        loj.setNomeFantasia(request.getParameter("txtNomeFantasia"));
        loj.setResponsavel(request.getParameter("txtResponsavel"));
        loj.setSite(request.getParameter("txtSite"));
        loj.setIdInfoAdic(info);

        daoLoj.alterar(loj);

        msg = "Registro alterado com sucesso";


        } catch (Exception e) {
        msg = e.getMessage();

        }

        request.setAttribute("mensagem", msg);
        request.getRequestDispatcher("listaLoja.jsp").forward(request, response);


        }
         * *
         */

        // Exclui o registro selecionado
        if (request.getParameter("acao").equals("excluir")) {
            loj = new Loja();
            log = new Login();
            info = new InfoAdicionais();
            int id = Integer.parseInt(request.getParameter("id"));
            try {

                // Localiza a loja
                loj = daoLoj.buscarPorId(id);

                // Localiza o InfoAdic da loja e exclui
                info = daoInfo.buscarPorId(loj.getIdInfoAdic().getIdInfoAdic());
                daoInfo.excluir(info);

                // Localiza o Login da loja e exclui
                log = daoLog.buscarPorLogin(loj.getLogin().getIdLogin());
                daoLog.excluir(log);

                //Exclui a loja
                daoLoj.excluir(loj);
                msg = "Registro apagado com sucesso";
            } catch (Exception e) {
                msg = e.getMessage();
            }
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("listaLoja.jsp").forward(request, response);
        }

    

 %>
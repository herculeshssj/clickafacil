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


        response.setContentType("text/html;charset=UTF-8");
       

        String msg = null;
        Login l = null;
        LoginDao dao = new LoginDao();

        String nome = request.getParameter("txtLogin");
        String senha = request.getParameter("txtSenha");

        if (Util.eVazio(nome)) {
            msg = "Informe o login";
        } else if (Util.eVazio(senha)) {
            msg = "Informe a senha";
        } else {
            try {
                l = dao.buscarPorLogin(nome);
                if (!l.getSenhaLogin().equals(Util.criptografar(senha))) {
                    msg = "Senha incorreta!";
                } else if (!(l.getLoginAtivo() == 1)) {
                    msg = "Login inativo. Contate o administrador.";
                } else {                    
                    request.getSession().setAttribute("userLogado", l);
                    request.getRequestDispatcher("principal.jsp").forward(request, response);
                }
            } catch (Exception e) {
                msg = "Login informado não existe!";
            }

        }
        request.setAttribute("mensagem", msg);
        if (!response.isCommitted()){
        	request.getRequestDispatcher("login.jsp").forward(request, response);	
        }
        


%>
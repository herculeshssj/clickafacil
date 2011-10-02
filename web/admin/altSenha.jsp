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
	Login l = new Login();
	LoginDao dao = new LoginDao();

	String senhaAtual = request.getParameter("txtSenhaAtual");
	String novaSenha = request.getParameter("txtNovaSenha");
	String confirmaSenha = request.getParameter("txtConfirmaSenha");

	// ValidaÃ§Ã£o dos campos
	if (Util.eVazio(senhaAtual)) {
		msg = "Informe a senha atual";
	} else if (Util.eVazio(novaSenha)) {
		msg = "Informe a nova senha";
	} else if (Util.eVazio(confirmaSenha)) {
		msg = "Confirme a nova senha";
	} else if (!novaSenha.equals(confirmaSenha)) {
		msg = "A nova senha informada não coincidem";
	} else {
		try {
			l = dao.buscarPorLogin(new Integer(request
					.getParameter("txtIdLogin")));
			if (!l.getSenhaLogin()
					.equals(Util.criptografar(senhaAtual))) {
				msg = "Senha atual informada está incorreta!";
			} else {
				l.setSenhaLogin(Util.criptografar(novaSenha));
				dao.alterar(l);
				msg = "Senha alterada com sucesso!";
			}

		} catch (Exception e) {
			msg = "Não foi possível alterar a senha!<br/>";
			msg = msg + e.getMessage();
		}
	}
	request.setAttribute("mensagem", msg);
	request.getRequestDispatcher("mudarSenha.jsp").forward(request,
			response);
%>

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

        String msg = null;

        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail");
        String assunto = request.getParameter("txtAssunto");
        String texto = request.getParameter("txtMensagem");

        if (Util.eVazio(nome) || Util.eVazio(email) || Util.eVazio(assunto) || Util.eVazio(texto)) {
            msg = "Sua mensagem não pôde ser enviada. Um dos campos do formulário está em branco.";
            request.setAttribute("msgErro", msg);
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        } else {
            EnviaEmail mail = new EnviaEmail();
            mail.enviar(email, "hercules_hssj@yahoo.com.br", assunto, texto);
            msg = "Sua mensagem foi enviada com sucesso.<br/><br/>";
            msg = msg + "Em breve estaremos entrando em contato";
            request.setAttribute("msgSucesso", msg);
            request.getRequestDispatcher("sucesso.jsp").forward(request, response);
        }


%>
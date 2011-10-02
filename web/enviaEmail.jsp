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

        String msg = null;

        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail");
        String assunto = request.getParameter("txtAssunto");
        String texto = request.getParameter("txtMensagem");

        if (Util.eVazio(nome) || Util.eVazio(email) || Util.eVazio(assunto) || Util.eVazio(texto)) {
            msg = "Sua mensagem n�o p�de ser enviada. Um dos campos do formul�rio est� em branco.";
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
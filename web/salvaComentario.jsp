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
        String msg = null;

        // Declaração dos objetos
        Internauta i = new Internauta();
        Comentario c = new Comentario();

        InternautaDao daoInter = new InternautaDao();
        ComentarioDao daoCom = new ComentarioDao();
        LojaDao daoLoja = new LojaDao();

        // Atribuição dos valores vindos do formulário
        int id = new Integer(request.getParameter("txtIdLoja"));

        i.setNome(request.getParameter("txtNome"));
        i.setEmail(request.getParameter("txtEmail"));

        c.setClassificacao(new Integer(request.getParameter("txtClassificacao")));
        c.setDataInclusao(new Date());
        c.setDescricao(request.getParameter("txtDescricao"));

        // Valida os campos e salva o registro
        try {
            if (Util.eVazio(i.getNome()) || Util.eVazio(i.getEmail())) {
                msg = "Coment�rio n�o postado. Informe o nome e e-mail";
            } else if (!daoInter.verificaEmail(i.getEmail())) {
                msg = "Coment�rio n�o postado. E-Mail informado j� existe";
            } else if (!Util.validaEmail(i.getEmail())) {
                msg = "Coment�rio n�o postado. E-Mail informado n�o � v�lido";
            } else {
                c.setIdLoja(daoLoja.buscarPorId(id));
                daoCom.salvar(c, i);
                msg = "Coment�rio postado com sucesso";
            }
        } catch (Exception e) {
            msg = "N�o foi poss�vel postar o coment�rio";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("id", id);
        request.getRequestDispatcher("verComentarios.jsp").forward(request, response);


%>
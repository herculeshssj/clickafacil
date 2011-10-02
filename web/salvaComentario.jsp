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
        String msg = null;

        // DeclaraÃ§Ã£o dos objetos
        Internauta i = new Internauta();
        Comentario c = new Comentario();

        InternautaDao daoInter = new InternautaDao();
        ComentarioDao daoCom = new ComentarioDao();
        LojaDao daoLoja = new LojaDao();

        // AtribuiÃ§Ã£o dos valores vindos do formulÃ¡rio
        int id = new Integer(request.getParameter("txtIdLoja"));

        i.setNome(request.getParameter("txtNome"));
        i.setEmail(request.getParameter("txtEmail"));

        c.setClassificacao(new Integer(request.getParameter("txtClassificacao")));
        c.setDataInclusao(new Date());
        c.setDescricao(request.getParameter("txtDescricao"));

        // Valida os campos e salva o registro
        try {
            if (Util.eVazio(i.getNome()) || Util.eVazio(i.getEmail())) {
                msg = "Comentário não postado. Informe o nome e e-mail";
            } else if (!daoInter.verificaEmail(i.getEmail())) {
                msg = "Comentário não postado. E-Mail informado já existe";
            } else if (!Util.validaEmail(i.getEmail())) {
                msg = "Comentário não postado. E-Mail informado não é válido";
            } else {
                c.setIdLoja(daoLoja.buscarPorId(id));
                daoCom.salvar(c, i);
                msg = "Comentário postado com sucesso";
            }
        } catch (Exception e) {
            msg = "Não foi possível postar o comentário";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("id", id);
        request.getRequestDispatcher("verComentarios.jsp").forward(request, response);


%>
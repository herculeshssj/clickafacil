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
        Produto pd = null;
        Loja lj = null;
        Preco p = null;
        ProdutoDao daoProd = new ProdutoDao();
        LojaDao daoLoj = new LojaDao();
        PrecoDao daoPreco = new PrecoDao();



        if (request.getParameter("acao").equals("cadastrar")) {

            request.getRequestDispatcher("formPreco.jsp").forward(request, response);

        }

        if (request.getParameter("acao").equals("salvar")) {

            p = new Preco();

            p.setValorPreco(new Double(request.getParameter("txtPreco")));
            p.setMoedaCorrente("R$");
            try {
                p.setIdLoja(daoLoj.buscarPorId(new Integer(request.getParameter("txtIdLoja"))));
                p.setIdProduto(daoProd.buscarPorId(new Integer(request.getParameter("txtIdProduto"))));

                daoPreco.salvar(p);

                msg = "Registro salvo com sucesso";

            } catch (Exception e) {
                msg = e.getMessage();
            }

            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("formPreco.jsp").forward(request, response);


        }

        if (request.getParameter("acao").equals("editar")) {

            p = new Preco();
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                p = daoPreco.buscarPorId(id);
            } catch (Exception e) {
                msg = e.getMessage();
                request.setAttribute("mensagem", msg);
                request.getRequestDispatcher("listPreco.jsp").forward(request, response);
            }
            request.setAttribute("preco", p);
            request.getRequestDispatcher("formPreco.jsp").forward(request, response);

        }

        if (request.getParameter("acao").equals("alterar")) {


            p = new Preco();

            p.setValorPreco(new Double(request.getParameter("txtPreco")));
            p.setMoedaCorrente("R$");
            try {
                p.setIdLoja(daoLoj.buscarPorId(new Integer(request.getParameter("txtIdLoja"))));
                p.setIdProduto(daoProd.buscarPorId(new Integer(request.getParameter("txtIdProduto"))));

                daoPreco.alterar(p);

                msg = "Registro alterado com sucesso";

            } catch (Exception e) {
                msg = e.getMessage();
            }

            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("listPreco.jsp").forward(request, response);

        }

        if (request.getParameter("acao").equals("excluir")) {
        }

 %>
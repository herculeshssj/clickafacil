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
        Produto p = null;
        Categoria c = null;
        CategoriaDao daoCat = new CategoriaDao();
        ProdutoDao dao = new ProdutoDao();

        // Leva para o formulÃ¡rio para realizar o cadastro
        if (request.getParameter("acao").equals("cadastrar")) {
            request.setAttribute("prod", p);
            request.getRequestDispatcher("formProduto.jsp").forward(request, response);
        }

        // Pega os dados do formulÃ¡rio e salva no banco de dados
        if (request.getParameter("acao").equals("salvar")) {
            p = new Produto();
            p.setNomeProduto(request.getParameter("txtNomeProduto"));
            p.setFabricante(request.getParameter("txtFabricante"));
            p.setModelo(request.getParameter("txtModelo"));
            p.setDescricao(request.getParameter("txtDescricao"));

            if (p.getNomeProduto().trim().equals("") ||
                p.getFabricante().trim().equals("") ||
                p.getModelo().trim().equals("") ||
                Integer.parseInt(request.getParameter("txtIdCategoria")) == 0)
                {
                    msg = "Preencha os todos os campos obrigatÃ³rios";
                } else {
                    try {
                        p.setIdCategoria(daoCat.buscarPorId(Integer.parseInt(request.getParameter("txtIdCategoria"))));
                        dao.salvar(p);
                        msg = "Registro salvo com sucesso";
                    } catch (Exception e) {
                        msg = e.getMessage();
                    }

                }

            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("formProduto.jsp").forward(request, response);

        }

        // Carrega os dados para o formulÃ¡rio para alterar
        if (request.getParameter("acao").equals("editar")) {
            p = new Produto();
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                p = dao.buscarPorId(id);
            } catch (Exception e) {
                msg = e.getMessage();
                request.setAttribute("mensagem", msg);
                request.getRequestDispatcher("listProduto.jsp").forward(request, response);
            }
            request.setAttribute("prod", p);
            request.getRequestDispatcher("formProduto.jsp").forward(request, response);

        }


        // Salva os dados do formulÃ¡rio
        if (request.getParameter("acao").equals("alterar")) {
            p = new Produto();
            p.setIdProduto(Integer.parseInt(request.getParameter("txtIdProduto")));
            p.setNomeProduto(request.getParameter("txtNomeProduto"));
            p.setFabricante(request.getParameter("txtFabricante"));
            p.setModelo(request.getParameter("txtModelo"));
            p.setDescricao(request.getParameter("txtDescricao"));
            //if (request.getParameter("txtIdProduto") != null) {
            //c.setIdProduto(Integer.parseInt(request.getParameter("txtIdProduto")));
            //out.print(request.getParameter("txtIdProduto"));
            //}


            try {
                // Busca a categoria pelo id para carregar no atributo do objeto
                p.setIdCategoria(daoCat.buscarPorId(Integer.parseInt(request.getParameter("txtIdCategoria"))));
            } catch (Exception e) {
                msg = e.getMessage();
            }

            try {
                //if (dao.buscarPorId(c.getIdProduto()) == null) {
                dao.alterar(p);
                //} else {
                //    dao.alterar(c);
                //}
                msg = "Registro alterado com sucesso";

            } catch (Exception e) {
                msg = e.getMessage();
            }

            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("listProduto.jsp").forward(request, response);

        }

        // Exclui o registro selecionado
        if (request.getParameter("acao").equals("excluir")) {
            p = new Produto();
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                p = dao.buscarPorId(id);
                dao.excluir(p);
                msg = "Registro apagado com sucesso";
            } catch (Exception e) {
                msg = e.getMessage();
            }
            request.setAttribute("prod", p);
            request.getRequestDispatcher("listProduto.jsp").forward(request, response);
        }

        //request.setAttribute("mensagem", msg);
        //request.getRequestDispatcher("listProduto.jsp").forward(request, response);

        /*




        Produto c = new Produto();
        ProdutoDao dao = new ProdutoDao();

        c.setIdProduto(Converter.nuloParaInt(request.getParameter("txtIdProduto")));
        c.setNomeProduto(request.getParameter("txtNomeProduto"));
        c.setDescricao(request.getParameter("txtDescricao"));

        out.print(request.getParameter("acao"));
        out.print(request.getParameter("id"));


        try {
        dao.salvar(c);
        msg = "Registro salvo com sucesso";
        } catch (Exception e) {
        msg = e.getMessage();
        }

        request.setAttribute("mensagem", msg);
        request.getRequestDispatcher("formProduto.jsp").forward(request, response);
         */


        /*
        String opcao = request.getParameter("action");


        if (opcao.equals("cadastrar")) {
        c.setNomeProduto(request.getParameter("txtNomeProduto"));
        c.setDescricao(request.getParameter("txtDescricao"));
        try {
        dao.salvar(c);
        msg = "Registro salvo com sucesso";
        } catch (Exception e) {
        msg = e.getMessage();
        }

        }


        /*
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet ProdutoServlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet ProdutoServlet at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");

        } finally {
        out.close();
        }
         */
 
 %>
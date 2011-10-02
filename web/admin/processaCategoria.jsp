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
        Categoria c = null;
        CategoriaDao dao = new CategoriaDao();
        ProdutoDao daoProd = new ProdutoDao();
        
      

        // Leva para o formulÃ¡rio para realizar o cadastro
        if (request.getParameter("acao").equals("cadastrar")) {
            request.setAttribute("categ", c);
            request.getRequestDispatcher("formCategoria.jsp").forward(request, response);
        }

        // Pega os dados do formulÃ¡rio, valida os campos e salva no banco de dados
        if (request.getParameter("acao").equals("salvar")) {
            c = new Categoria();
            c.setNomeCategoria(request.getParameter("txtNomeCategoria"));
            c.setDescricao(request.getParameter("txtDescricao"));
            
           if (c.getNomeCategoria().trim().equals("") || c.getDescricao().trim().equals("")) {
        	   msg = "Preencha todos os campos";
           } else {
        	   try {
        		   dao.salvar(c);
        		   msg = "Registro salvo com sucesso";
        	   } catch (Exception e) {
        		   msg = e.getMessage();
        	   }
           }
            
           request.setAttribute("mensagem", msg);
           request.getRequestDispatcher("formCategoria.jsp").forward(request, response);

        }

        // Leva para o formulÃ¡rio de cadastro com as informaÃ§Ãµes do registro
        if (request.getParameter("acao").equals("editar")) {
            c = new Categoria();
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                c = dao.buscarPorId(id);
            } catch (Exception e) {
                msg = e.getMessage();
                request.setAttribute("mensagem", msg);
                request.getRequestDispatcher("listaCategoria.jsp").forward(request, response);
            }
            request.setAttribute("categ", c);
            request.getRequestDispatcher("formCategoria.jsp").forward(request, response);

        }

        // Salva as alteraÃ§Ãµes no banco de dados
        if (request.getParameter("acao").equals("alterar")) {
            c = new Categoria();
            c.setIdCategoria(Integer.parseInt(request.getParameter("txtIdCategoria")));
            c.setNomeCategoria(request.getParameter("txtNomeCategoria"));
            c.setDescricao(request.getParameter("txtDescricao"));
            
            try {
                
                dao.alterar(c);
                
                msg = "Registro alterado com sucesso";

            } catch (Exception e) {
                msg = e.getMessage();
            }

            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("listaCategoria.jsp").forward(request, response);

        }

        // Verifica se a categoria contÃ©m produtos, caso contrÃ¡rio, exclui o registro
        
        if (request.getParameter("acao").equals("excluir")) {
        	
        	int id = new Integer(request.getParameter("id"));
        	c = new Categoria();
        	List<Produto> lista = new ArrayList<Produto>();
        	
        	try {
        		lista = daoProd.buscarPorCategoria(id);
        		if (lista.size() > 0) {
        			msg = "Nao e possivel excluir, categoria possui produtos cadastrados";
        		} else {
        			c = dao.buscarPorId(id);
        			dao.excluir(c);
        			msg = "Registro excluido com sucesso";
        		}        		 
        	} catch (Exception e) {
        		msg = e.getMessage();
        	}
        	
        	request.setAttribute("mensagem", msg);
        	request.getRequestDispatcher("listaCategoria.jsp").forward(request, response);
        }
        

 %>
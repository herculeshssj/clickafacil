<%--

    Copyright (c) 2009, 2010 HÈrcules S. S. JosÈ
    

    Este arquivo È parte do programa ClickaFacil.

    ClickaFacil È um software livre; vocÍ pode redistribui-lo e/ou 

    modific·-lo dentro dos termos da LicenÁa P˙blica Geral Menor GNU como 

    publicada pela FundaÁ„o do Software Livre (FSF); na vers„o 2.1 da 

    LicenÁa.
    
    
    Este programa È distribuÌdo na esperanÁa que possa ser util, 

    mas SEM NENHUMA GARANTIA; sem uma garantia implicita de ADEQUA«¬O a qualquer

    MERCADO ou APLICA«√O EM PARTICULAR. Veja a LicenÁa P˙blica Geral Menor GNU em 
    
    portuguÍs para maiores detalhes.
    
    
    VocÍ deve ter recebido uma cÛpia da LicenÁa P˙blica Geral Menor GNU sob o 

    nome de "LICENSE.TXT" junto com este programa, se n„o, acesse o site HSlife no 

    endereco www.hslife.com.br ou escreva para a FundaÁ„o do Software Livre(FSF) Inc., 

    51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA.
    
    
    Para mais informaÁıes sobre o programa ClickaFacil e seus autores acesso o 

    endereÁo www.hslife.com.br, pelo e-mail contato@hslife.com.br ou escreva para 

    HÈrcules S. S. JosÈ, Av. Ministro Lafaeyte de Andrade, 1683 - Bl. 3 Apt 404, 

    Marco II - Nova IguaÁu, RJ, Brasil.

--%>

<%@page import="br.com.hslife.clickafacil.javabeans.*"%> 
<%@page import="br.com.hslife.clickafacil.dao.*"%>
<%@page import="java.util.*" %>

<%


        response.setContentType("text/html;charset=UTF-8");
       
        String mensagem;

        String tipoBusca = request.getParameter("rdTipoBusca");
        String valorBusca = request.getParameter("txtBusca");

        PrecoDao daoPreco = new PrecoDao();

        if (valorBusca == null || valorBusca.trim().equals("")) {
            mensagem = "Entre com um valor no campo de busca!";
            request.setAttribute("msgErro", mensagem);
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        }

        if (tipoBusca.equals("Produto")) {
            
            try {
                List<Preco> listaBusca = daoPreco.buscarPorNomeProduto(valorBusca);

                request.setAttribute("resultadoBusca", listaBusca);
                request.setAttribute("valorBusca", valorBusca);
                request.getRequestDispatcher("resultadoBusca.jsp").forward(request, response);
            } catch (Exception e) {
                mensagem = "N√£o foi poss√≠vel realizar sua busca!";
                request.setAttribute("msgErro", mensagem);
                request.getRequestDispatcher("erro.jsp").forward(request, response);
            }

        }

         if (tipoBusca.equals("Loja")) {

            try {
                List<Preco> listaBusca = daoPreco.buscarPorNomeLoja(valorBusca);

                request.setAttribute("resultadoBusca", listaBusca);
                request.setAttribute("valorBusca", valorBusca);
                request.getRequestDispatcher("resultadoBusca.jsp").forward(request, response);
            } catch (Exception e) {
                mensagem = "N√£o foi poss√≠vel realizar sua busca!";
                request.setAttribute("msgErro", mensagem);
                request.getRequestDispatcher("erro.jsp").forward(request, response);
            }

        }

   

%>
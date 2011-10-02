/*** 

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

 ***/

package br.com.hslife.clickafacil.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.hslife.clickafacil.hibernate.HibernateUtil;
import br.com.hslife.clickafacil.javabeans.InfoAdicionais;
import br.com.hslife.clickafacil.javabeans.Login;
import br.com.hslife.clickafacil.javabeans.Loja;

public class LojaDao {

    Session sessao;
    Transaction transacao;
    Criteria criterio;

    public void salvar(Loja l, Login g, InfoAdicionais i) throws Exception {
        try {
            sessao = HibernateUtil.getInstance();
            transacao = sessao.beginTransaction();
            sessao.saveOrUpdate(i);
            sessao.saveOrUpdate(g);
            l.setIdInfoAdic(i);
            l.setLogin(g);
            sessao.saveOrUpdate(l);
            transacao.commit();
        } catch (Exception e) {
            transacao.rollback();
            throw new Exception();
        }
    }

    public void alterar(Loja l, InfoAdicionais i) throws Exception {
        try {
            sessao = HibernateUtil.getInstance();
            transacao = sessao.beginTransaction();
            //sessao.merge(i);
            l.setIdInfoAdic(i);
            sessao.merge(l);
            transacao.commit();
        } catch (Exception e) {
            transacao.rollback();
            throw new Exception(e.getMessage());
        }
    }
    
    public void alterar(Loja l) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.update(l);
        transacao.commit();
    }

    public void excluir(Loja l) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.delete(l);
        transacao.commit();
    }

    public List listarTodos() throws Exception {
        sessao = HibernateUtil.getInstance();
        return sessao.createCriteria(Loja.class).list();
    }

    public Loja buscarPorId(Integer id) throws Exception {
        String hql = "from Loja where idLoja = :id";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setInteger("id", id);
        return (Loja) q.list().get(0);
    }

    // Verifica se a inscrição estadual informada existe
    public boolean inscricaoExiste(String numero) throws Exception {
        String hql = "from Loja where inscricaoEstadual = :numero";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setString("numero", numero);
        if (q.list().size() == 0) {
            return false;
        } else {
            return true;
        }

    }

    // Verifica se o CNPJ informado existe
    public boolean cnpjExiste(String numero) throws Exception {
        String hql = "from Loja where cnpj = :numero";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setString("numero", numero);
        if (q.list().size() == 0) {
            return false;
        } else {
            return true;
        }
    }

    public List buscarPorNomeLoja(String nome) throws Exception {
        //return sessao.createCriteria(Produto.class).add(Restrictions.ilike("nomeProduto", nome)).list();
        String hql = "from Loja where nomeFantasia = :nome";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setString("nome", nome);
        return q.list();
    }
}

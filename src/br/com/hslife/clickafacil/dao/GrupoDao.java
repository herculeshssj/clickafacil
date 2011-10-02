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
import br.com.hslife.clickafacil.javabeans.Grupo;

public class GrupoDao {

    Session sessao;
    Transaction transacao;
    Criteria criterio;

    public void salvar(Grupo g) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.save(g);
        transacao.commit();

    }

    public void alterar(Grupo g) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.merge(g);
        transacao.commit();
    }

    public void excluir(Grupo g) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.delete(g);
        transacao.commit();
    }

    public List listarTodos() throws Exception {
        List lista = null;
        sessao = HibernateUtil.getInstance();
        lista = sessao.createCriteria(Grupo.class).list();
        return lista;
    }

    public Grupo buscarPorId(Integer id) throws Exception {
        String hql = "from Grupo where idGrupo = :id";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setInteger("id", id);
        return (Grupo) q.list().get(0);
    }

}

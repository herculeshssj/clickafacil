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
import br.com.hslife.clickafacil.javabeans.Internauta;

public class InternautaDao {

    Session sessao;
    Transaction transacao;
    Criteria criterio;

    public void salvar(Internauta i) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.save(i);
        transacao.commit();

    }

    public void alterar(Internauta i) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.update(i);
        transacao.commit();
    }

    public void excluir(Internauta i) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.delete(i);
        transacao.commit();
    }

    public List listarTodos() throws Exception {
        sessao = HibernateUtil.getInstance();
        return sessao.createCriteria(Internauta.class).list();
    }

    // Verifica se existe um e-mail igual previamente cadastrado.
    public boolean verificaEmail(String email) throws Exception {
        String hql = "from Internauta where email = :email";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setString("email", email);
        // Retorna true se nenhum outro e-mail foi localizado
        if (q.list().size() == 0) {
            return true;
        } else {
            return false;
        }
    }

}

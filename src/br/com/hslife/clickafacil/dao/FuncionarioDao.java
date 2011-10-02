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
import br.com.hslife.clickafacil.javabeans.Funcionario;
import br.com.hslife.clickafacil.javabeans.InfoAdicionais;
import br.com.hslife.clickafacil.javabeans.Login;


public class FuncionarioDao {

    Session sessao;
    Transaction transacao;
    Criteria criterio;

    public void salvar(Funcionario f) throws Exception {
        sessao = HibernateUtil.getInstance();
        transacao = sessao.beginTransaction();
        sessao.save(f);
        transacao.commit();

    }
    
    public void salvar(Funcionario f, Login l, InfoAdicionais i) throws Exception {
        try {
            sessao = HibernateUtil.getInstance();
            transacao = sessao.beginTransaction();
            sessao.saveOrUpdate(i);
            sessao.saveOrUpdate(l);
            f.setIdInfoAdic(i);
            f.setLogin(l);
            sessao.saveOrUpdate(f);
            transacao.commit();
        } catch (Exception e) {
            transacao.rollback();
            throw new Exception();
        }
    }

    public void alterar(Funcionario f) throws Exception {
        try {
            sessao = HibernateUtil.getInstance();
            transacao = sessao.beginTransaction();            
            sessao.update(f);
            transacao.commit();
        } catch (Exception e) {
        	System.out.println(e.getMessage());
            transacao.rollback();
            throw new Exception(e.getMessage());
        }
    }

    public void excluir(Funcionario f) throws Exception {
    	try {
    		sessao = HibernateUtil.getInstance();
            transacao = sessao.beginTransaction();
            sessao.delete(f.getLogin());
            sessao.delete(f.getIdInfoAdic());
            sessao.delete(f);
            transacao.commit();	
    	} catch (Exception e) {
    		transacao.rollback();
    		throw new Exception();
    	}
        
    }

    public List listarTodos() throws Exception {
        sessao = HibernateUtil.getInstance();
        return sessao.createCriteria(Funcionario.class).list();
    }

    public Funcionario buscarPorId(Integer id) throws Exception {
        String hql = "from Funcionario where idFuncionario = :id";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setInteger("id", id);
        return (Funcionario) q.list().get(0);
    }
    
 // Verifica se a inscrição estadual informada existe
    public boolean matriculaExiste(String numero) throws Exception {
        String hql = "from Funcionario where matricula = :numero";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setString("numero", numero);
        if (q.list().size() == 0) {
            return false;
        } else {
            return true;
        }

    }

 // Verifica se o CPF informado existe
    public boolean cpfExiste(String numero) throws Exception {
        String hql = "from Funcionario where cpf = :numero";
        Query q = HibernateUtil.getInstance().createQuery(hql);
        q.setString("numero", numero);
        if (q.list().size() == 0) {
            return false;
        } else {
            return true;
        }
    }
}

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

package br.com.hslife.clickafacil.javabeans;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

// Definir as classes que tem valores únicos (não podem ter duplicata na tabela)

@Entity
@Table(name = "loja")
public class Loja implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -72243374461155045L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idLoja")
	private Integer idLoja; // chave primária auto numerada

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "idInfoAdic")
	private InfoAdicionais idInfoAdic; // chave estrangeira refencia  InfoAdicionais

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "idLogin")
	private Login login; // chave estrangeira referencia Login

	@Column(name = "nomeFantasia", length = 100, nullable = false)
	private String nomeFantasia; // tamanho 100 não nulo

	@Column(name = "cnpj", length = 20, nullable = false, unique=true)
	private String cnpj; // tamanho 20 não nulo

	@Column(name = "inscricaoEstadual", length = 10, nullable = false, unique=true)
	private String inscricaoEstadual; // tamanho 10 não nulo

	@Column(name = "site", length = 50, nullable = true)
	private String site; // tamanho 50 permite nulo

	@Column(name = "responsavel", length = 50, nullable = false)
	private String responsavel; // tamanho 50 não nulo

        @Column(columnDefinition="LongText", name = "informacoes", nullable = true)
        private String informacoes;

        public Loja() {
            nomeFantasia = "";
            cnpj = "";
            inscricaoEstadual = "";
            site = "";
            responsavel = "";
        }

	/**
	 * @return the idLoja
	 */
	public Integer getIdLoja() {
		return idLoja;
	}

	/**
	 * @param idLoja
	 *            the idLoja to set
	 */
	public void setIdLoja(Integer idLoja) {
		this.idLoja = idLoja;
	}

	/**
	 * @return the idInfoAdic
	 */
	public InfoAdicionais getIdInfoAdic() {
		return idInfoAdic;
	}

	/**
	 * @param idInfoAdic
	 *            the idInfoAdic to set
	 */
	public void setIdInfoAdic(InfoAdicionais idInfoAdic) {
		this.idInfoAdic = idInfoAdic;
	}

	/**
	 * @return the nomeFantasia
	 */
	public String getNomeFantasia() {
		return nomeFantasia;
	}

	/**
	 * @param nomeFantasia
	 *            the nomeFantasia to set
	 */
	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	/**
	 * @return the cnpj
	 */
	public String getCnpj() {
		return cnpj;
	}

	/**
	 * @param cnpj
	 *            the cnpj to set
	 */
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	/**
	 * @return the inscricaoEstadual
	 */
	public String getInscricaoEstadual() {
		return inscricaoEstadual;
	}

	/**
	 * @param inscricaoEstadual
	 *            the inscricaoEstadual to set
	 */
	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

	/**
	 * @return the site
	 */
	public String getSite() {
		return site;
	}

	/**
	 * @param site
	 *            the site to set
	 */
	public void setSite(String site) {
		this.site = site;
	}

	/**
	 * @return the responsavel
	 */
	public String getResponsavel() {
		return responsavel;
	}

	/**
	 * @param responsavel
	 *            the responsavel to set
	 */
	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	/**
	 * @return the login
	 */
	public Login getLogin() {
		return login;
	}

	/**
	 * @param login
	 *            the login to set
	 */
	public void setLogin(Login login) {
		this.login = login;
	}

    /**
     * @return the informacoes
     */
    public String getInformacoes() {
        return informacoes;
    }

    /**
     * @param informacoes the informacoes to set
     */
    public void setInformacoes(String informacoes) {
        this.informacoes = informacoes;
    }

}

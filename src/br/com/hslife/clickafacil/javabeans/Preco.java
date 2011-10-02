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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

// Definir as classes que tem valores únicos (não podem ter duplicata na tabela)

@Entity
@Table(name = "preco")
@NamedQueries({
    @NamedQuery(name="busca.loja", query="select e from Preco e, Loja l where l.idLoja = e.idLoja and l.nomeFantasia like concat('%', :loja, '%') order by valorPreco"),
    @NamedQuery(name="busca.produto", query="select e from Preco e, Produto p where p.idProduto = e.idProduto and p.nomeProduto like concat('%', :produto, '%') order by valorPreco")
})
public class Preco implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 180389780594347930L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idPreco")
	private Integer idPreco; // chave primaria auto numerada

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "idProduto")
	private Produto idProduto; // chave estrangeira referencia Produto

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "idLoja")
	private Loja idLoja; // chave estrangeira referencia a Loja

	@Column(name = "valorPreco", nullable = false)
	private Double valorPreco; // não nulo

	@Column(name = "moedaCorrente", length = 10, nullable = false)
	private String moedaCorrente; // tamanho 10 não nulo

	/**
	 * @return the idPreco
	 */
	public Integer getIdPreco() {
		return idPreco;
	}

	/**
	 * @param idPreco
	 *            the idPreco to set
	 */
	public void setIdPreco(Integer idPreco) {
		this.idPreco = idPreco;
	}

	/**
	 * @return the idProduto
	 */
	public Produto getIdProduto() {
		return idProduto;
	}

	/**
	 * @param idProduto
	 *            the idProduto to set
	 */
	public void setIdProduto(Produto idProduto) {
		this.idProduto = idProduto;
	}

	/**
	 * @return the idLoja
	 */
	public Loja getIdLoja() {
		return idLoja;
	}

	/**
	 * @param idLoja
	 *            the idLoja to set
	 */
	public void setIdLoja(Loja idLoja) {
		this.idLoja = idLoja;
	}

	/**
	 * @return the valorPreco
	 */
	public Double getValorPreco() {
		return valorPreco;
	}

	/**
	 * @param valorPreco
	 *            the valorPreco to set
	 */
	public void setValorPreco(Double valorPreco) {
		this.valorPreco = valorPreco;
	}

	/**
	 * @return the moedaCorrente
	 */
	public String getMoedaCorrente() {
		return moedaCorrente;
	}

	/**
	 * @param moedaCorrente
	 *            the moedaCorrente to set
	 */
	public void setMoedaCorrente(String moedaCorrente) {
		this.moedaCorrente = moedaCorrente;
	}

}

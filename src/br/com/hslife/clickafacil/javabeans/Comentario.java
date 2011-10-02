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
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "comentario")
public class Comentario implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5680413173126979037L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idComentario")
	private Integer idComentario; // chave primária auto numerada

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "idLoja")
	private Loja idLoja; // chave estrangeira referencia a tabela Loja

        @ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "idInternauta")
	private Internauta idInternauta; // chave estrangeira referencia a tabela Internauta

	@Column(columnDefinition="LongText", name = "descricao", nullable = true)
	private String descricao; // tipo texto longo

	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name = "dataInclusao", nullable = false)
	private Date dataInclusao; // tipo data não nulo

	@Column(name = "classificacao", nullable = true)
	private Integer classificacao; // tipo inteiro não nulo

	// Valores aceitos pelo campo:
	// 0 - Ruim; 1 - Fraco; 2 - Regular; 3 - Bom; 4 - Ótimo; 5 - Excelente
	// 9 - Não classificado

	/**
	 * @return the idComentario
	 */
	public Integer getIdComentario() {
		return idComentario;
	}

	/**
	 * @param idComentario
	 *            the idComentario to set
	 */
	public void setIdComentario(Integer idComentario) {
		this.idComentario = idComentario;
	}


	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao
	 *            the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @return the dataInclusao
	 */
	public Date getDataInclusao() {
		return dataInclusao;
	}

	/**
	 * @param dataInclusao
	 *            the dataInclusao to set
	 */
	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	/**
	 * @return the classificacao
	 */
	public Integer getClassificacao() {
		return classificacao;
	}

	/**
	 * @param classificacao
	 *            the classificacao to set
	 */
	public void setClassificacao(Integer classificacao) {
		this.classificacao = classificacao;
	}

    /**
     * @return the idLoja
     */
    public Loja getIdLoja() {
        return idLoja;
    }

    /**
     * @param idLoja the idLoja to set
     */
    public void setIdLoja(Loja idLoja) {
        this.idLoja = idLoja;
    }

    /**
     * @return the idInternauta
     */
    public Internauta getIdInternauta() {
        return idInternauta;
    }

    /**
     * @param idInternauta the idInternauta to set
     */
    public void setIdInternauta(Internauta idInternauta) {
        this.idInternauta = idInternauta;
    }

 

        

}

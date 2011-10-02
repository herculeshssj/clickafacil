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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "infoadicionais")
public class InfoAdicionais implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2667759122321869454L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idInfoAdic")
	private Integer idInfoAdic; // chave primaria auto numerada

	@Column(name = "nome", length = 100, nullable = false)
	private String nome; // tamanho 50 não nulo

	@Column(name = "email", length = 50, nullable = true, unique = true)
	private String email; // tamanho 50 permite nulo

	@Column(name = "endereco", length = 200, nullable = false)
	private String endereco; // tamanho 100 não nulo

	@Column(name = "numero", length= 10, nullable = true)
	private String numero; // nulo

	@Column(name = "complemento", length = 50, nullable = true)
	private String complemento; // tamanho 50 permite nulo

	@Column(name = "bairro", length = 50, nullable = false)
	private String bairro; // tamanho 50 não nulo

	@Column(name = "cidade", length = 50, nullable = false)
	private String cidade; // tamanho 50 não nulo

	@Column(name = "cep", length = 8, nullable = false)
	private String cep; // tamanho 8 não nulo

	@Column(name = "estado", length = 2, nullable = false)
	private String estado; // tamanho 2 não nulo

	@Column(name = "telefone", length = 8, nullable = false)
	private String telefone; // tamanho 8 não nulo

	@Column(name = "ddd", length = 2, nullable = false)
	private String ddd; // tamanho 2 não nulo

	public InfoAdicionais() {
		this.nome = "";
		this.email = "";
		this.endereco = "";
		this.numero = "";
		this.complemento = "";
		this.bairro = "";
		this.cidade = "";
		this.cep = "";
		this.estado = "";
		this.telefone = "";
		this.ddd = "";
	}

	/**
	 * @return the idInfoAdic
	 */
	public Integer getIdInfoAdic() {
		return idInfoAdic;
	}

	/**
	 * @param idInfoAdic
	 *            the idInfoAdic to set
	 */
	public void setIdInfoAdic(Integer idInfoAdic) {
		this.idInfoAdic = idInfoAdic;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome
	 *            the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the endereco
	 */
	public String getEndereco() {
		return endereco;
	}

	/**
	 * @param endereco
	 *            the endereco to set
	 */
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	/**
	 * @return the numero
	 */
	public String getNumero() {
		return numero;
	}

	/**
	 * @param numero
	 *            the numero to set
	 */
	public void setNumero(String numero) {
		this.numero = numero;
	}

	/**
	 * @return the complemento
	 */
	public String getComplemento() {
		return complemento;
	}

	/**
	 * @param complemento
	 *            the complemento to set
	 */
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	/**
	 * @return the bairro
	 */
	public String getBairro() {
		return bairro;
	}

	/**
	 * @param bairro
	 *            the bairro to set
	 */
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	/**
	 * @return the cidade
	 */
	public String getCidade() {
		return cidade;
	}

	/**
	 * @param cidade
	 *            the cidade to set
	 */
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	/**
	 * @return the cep
	 */
	public String getCep() {
		return cep;
	}

	/**
	 * @param cep
	 *            the cep to set
	 */
	public void setCep(String cep) {
		this.cep = cep;
	}

	/**
	 * @return the estado
	 */
	public String getEstado() {
		return estado;
	}

	/**
	 * @param estado
	 *            the estado to set
	 */
	public void setEstado(String estado) {
		this.estado = estado;
	}

	/**
	 * @return the telefone
	 */
	public String getTelefone() {
		return telefone;
	}

	/**
	 * @param telefone
	 *            the telefone to set
	 */
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	/**
	 * @return the ddd
	 */
	public String getDdd() {
		return ddd;
	}

	/**
	 * @param ddd
	 *            the ddd to set
	 */
	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

}

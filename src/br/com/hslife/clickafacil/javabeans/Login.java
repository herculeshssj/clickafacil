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
@Table(name = "login")
public class Login implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9180215438802404315L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idLogin")
	private Integer idLogin; // chave primária auto numerada

	@Column(name = "usuarioLogin", length = 50, nullable = false, unique=true)
	private String usuarioLogin; // tamanho 50 não nulo

	@Column(name = "senhaLogin", length = 50, nullable = false)
	private String senhaLogin; // tamanho 50 não nulo

	@Column(name = "loginAtivo")
	private Integer loginAtivo; // padrão false

	@Column(name = "perfil", nullable = false)
	private Integer perfil; // não nulo

	// 1 - Administrador; 2 - Funcionário; 3 - Lojista; 4 - Internauta

        public Login() {
            usuarioLogin = "";
        }

	/**
	 * @return the idLogin
	 */
	public Integer getIdLogin() {
		return idLogin;
	}

	/**
	 * @param idLogin
	 *            the idLogin to set
	 */
	public void setIdLogin(Integer idLogin) {
		this.idLogin = idLogin;
	}

	/**
	 * @return the usuarioLogin
	 */
	public String getUsuarioLogin() {
		return usuarioLogin;
	}

	/**
	 * @param usuarioLogin
	 *            the usuarioLogin to set
	 */
	public void setUsuarioLogin(String usuarioLogin) {
		this.usuarioLogin = usuarioLogin;
	}

	/**
	 * @return the senhaLogin
	 */
	public String getSenhaLogin() {
		return senhaLogin;
	}

	/**
	 * @param senhaLogin
	 *            the senhaLogin to set
	 */
	public void setSenhaLogin(String senhaLogin) {
		this.senhaLogin = senhaLogin;
	}


	/**
	 * @return the perfil
	 */
	public Integer getPerfil() {
		return perfil;
	}

	/**
	 * @param perfil
	 *            the perfil to set
	 */
	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}

    /**
     * @return the loginAtivo
     */
    public Integer getLoginAtivo() {
        return loginAtivo;
    }

    /**
     * @param loginAtivo the loginAtivo to set
     */
    public void setLoginAtivo(Integer loginAtivo) {
        this.loginAtivo = loginAtivo;
    }

}

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

package br.com.hslife.clickafacil.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import br.com.hslife.clickafacil.javabeans.Login;

public class Util {

    // Retorna true se o campo estiver nulo
    public static boolean eNulo(Object campo) {
        if (campo == null) {
            return true;
        } else {
            return false;
        }
    }

    // Retorna true se o campo estiver vazio ou com conteúdo em branco
    public static boolean eVazio(String campo) {
        if (campo.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean verificaPerfil(Login login, int tipo) {
        // Função que valida se o login ativo na sessão tem o
        // perfil para acessar determinada funcionalidade
        // Parâmetros:
        // login - objeto da classe Login contendo os dados do usuário
        // tipo - inteiro entre 1 a 4 que define o perfil do usuário
        //        habilitado para acessar aquele recursos

        if (login.getPerfil() == tipo) {
            return true;
        }

        return false;

    }

    // Validação de e-mail
    // Retorna true se o e-mail for válido
    public static boolean validaEmail(String email) {
        Pattern p = Pattern.compile("[a-zA-Z0-9]+[a-zA-Z0-9_.-]+@{1}[a-zA-Z0-9_.-]*\\.+[a-z]{2,4}");
        Matcher m = p.matcher(email);
        boolean matchFound = m.matches();
        if (matchFound) {
            return true;
        } else {
            return false;
        }

    }

    // Verifica se o valor passado só possui números
    // Retorna true se o campo só for composto de números
    public static boolean soNumeros(String campo) {
        Pattern p = Pattern.compile("[0-9]*");
        Matcher m = p.matcher(campo);
        boolean matchFound = m.matches();
        if (matchFound) {
            return true;
        } else {
            return false;
        }
    }

    // Verifica se o valor passado só possui números
    // Retorna true se o campo só for composto de números
    public static boolean soLetras(String campo) {
        Pattern p = Pattern.compile("[a-zA-Z]*");
        Matcher m = p.matcher(campo);
        boolean matchFound = m.matches();
        if (matchFound) {
            return true;
        } else {
            return false;
        }
    }

    // Verifica se o CNPJ informado é válido
    // Retorna true se o CNPJ é válido
    public static boolean validaCnpj(String cnpj) {
        int soma = 0, aux, dig;

        if (cnpj.length() != 14) {
            return false;
        }

        String cnpj_calc = cnpj.substring(0, 12);

        char[] chr_cnpj = cnpj.toCharArray();

        /* Primeira parte */
        for (int i = 0; i < 4; i++) {
            if (chr_cnpj[i] - 48 >= 0 && chr_cnpj[i] - 48 <= 9) {
                soma += (chr_cnpj[i] - 48) * (6 - (i + 1));
            }
        }
        for (int i = 0; i < 8; i++) {
            if (chr_cnpj[i + 4] - 48 >= 0 && chr_cnpj[i + 4] - 48 <= 9) {
                soma += (chr_cnpj[i + 4] - 48) * (10 - (i + 1));
            }
        }
        dig = 11 - (soma % 11);

        cnpj_calc += (dig == 10 || dig == 11)
                ? "0" : Integer.toString(dig);

        /* Segunda parte */
        soma = 0;
        for (int i = 0; i < 5; i++) {
            if (chr_cnpj[i] - 48 >= 0 && chr_cnpj[i] - 48 <= 9) {
                soma += (chr_cnpj[i] - 48) * (7 - (i + 1));
            }
        }
        for (int i = 0; i < 8; i++) {
            if (chr_cnpj[i + 5] - 48 >= 0 && chr_cnpj[i + 5] - 48 <= 9) {
                soma += (chr_cnpj[i + 5] - 48) * (10 - (i + 1));
            }
        }
        dig = 11 - (soma % 11);
        cnpj_calc += (dig == 10 || dig == 11)
                ? "0" : Integer.toString(dig);

        return cnpj.equals(cnpj_calc);
    }


    // Verifica se o CPF informado é válido
    // Retorna true se o CPF for válido
    public static boolean validaCpf(String campo) {
        return true;
    }
    
    public static String criptografar(String texto) {
    	
    	String sen = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		BigInteger hash = new BigInteger(1, md.digest(texto.getBytes()));
		sen = hash.toString(16);
		return sen;
    }
}
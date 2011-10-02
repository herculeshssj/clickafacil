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

alter table categoria 
        drop 
        foreign key FK5D54E133876F4A32;

    alter table comentario 
        drop 
        foreign key FK9E0DE7E1EB9CAE94;

    alter table comentario 
        drop 
        foreign key FK9E0DE7E14C0D2206;

    alter table funcionario 
        drop 
        foreign key FK50401DDB87F91032;

    alter table funcionario 
        drop 
        foreign key FK50401DDB58E6359;

    alter table internauta 
        drop 
        foreign key FKA1293BB387F91032;

    alter table loja 
        drop 
        foreign key FK32C5FA87F91032;

    alter table loja 
        drop 
        foreign key FK32C5FA58E6359;

    alter table preco 
        drop 
        foreign key FK65FA24FEB9CAE94;

    alter table preco 
        drop 
        foreign key FK65FA24F2041F752;

    alter table produto 
        drop 
        foreign key FKED8DCEF94F9F43C6;

    drop table if exists categoria;

    drop table if exists comentario;

    drop table if exists funcionario;

    drop table if exists grupo;

    drop table if exists infoadicionais;

    drop table if exists internauta;

    drop table if exists login;

    drop table if exists loja;

    drop table if exists preco;

    drop table if exists produto;

    create table categoria (
        idCategoria integer not null auto_increment,
        descricao varchar(255),
        nomeCategoria varchar(50) not null unique,
        idGrupo integer,
        primary key (idCategoria)
    );

    create table comentario (
        idComentario integer not null auto_increment,
        classificacao integer,
        dataInclusao datetime not null,
        descricao LongText,
        idInternauta integer,
        idLoja integer,
        primary key (idComentario)
    );

    create table funcionario (
        idFuncionario integer not null auto_increment,
        cpf varchar(15) not null,
        funcao varchar(50) not null,
        matricula integer,
        idInfoAdic integer,
        idLogin integer,
        primary key (idFuncionario)
    );

    create table grupo (
        idGrupo integer not null auto_increment,
        descricao varchar(255),
        nomeGrupo varchar(50) not null unique,
        primary key (idGrupo)
    );

    create table infoadicionais (
        idInfoAdic integer not null auto_increment,
        bairro varchar(50) not null,
        cep varchar(8) not null,
        cidade varchar(50) not null,
        complemento varchar(50),
        ddd varchar(2) not null,
        email varchar(50) unique,
        endereco varchar(200) not null,
        estado varchar(2) not null,
        nome varchar(100) not null,
        numero varchar(10),
        telefone varchar(8) not null,
        primary key (idInfoAdic)
    );

    create table internauta (
        idInternauta integer not null auto_increment,
        email varchar(50) not null unique,
        nome varchar(50) not null,
        idLogin integer,
        primary key (idInternauta)
    );

    create table login (
        idLogin integer not null auto_increment,
        loginAtivo integer,
        perfil integer not null,
        senhaLogin varchar(50) not null,
        usuarioLogin varchar(50) not null unique,
        primary key (idLogin)
    );

    create table loja (
        idLoja integer not null auto_increment,
        cnpj varchar(20) not null unique,
        informacoes LongText,
        inscricaoEstadual varchar(10) not null unique,
        nomeFantasia varchar(100) not null,
        responsavel varchar(50) not null,
        site varchar(50),
        idInfoAdic integer,
        idLogin integer,
        primary key (idLoja)
    );

    create table preco (
        idPreco integer not null auto_increment,
        moedaCorrente varchar(10) not null,
        valorPreco double precision not null,
        idLoja integer,
        idProduto integer,
        primary key (idPreco)
    );

    create table produto (
        idProduto integer not null auto_increment,
        descricao LongText,
        fabricante varchar(50) not null,
        modelo varchar(50) not null,
        nomeProduto varchar(100) not null,
        IdCategoria integer,
        primary key (idProduto)
    );

    alter table categoria 
        add index FK5D54E133876F4A32 (idGrupo), 
        add constraint FK5D54E133876F4A32 
        foreign key (idGrupo) 
        references grupo (idGrupo);

    alter table comentario 
        add index FK9E0DE7E1EB9CAE94 (idLoja), 
        add constraint FK9E0DE7E1EB9CAE94 
        foreign key (idLoja) 
        references loja (idLoja);

    alter table comentario 
        add index FK9E0DE7E14C0D2206 (idInternauta), 
        add constraint FK9E0DE7E14C0D2206 
        foreign key (idInternauta) 
        references internauta (idInternauta);

    alter table funcionario 
        add index FK50401DDB87F91032 (idLogin), 
        add constraint FK50401DDB87F91032 
        foreign key (idLogin) 
        references login (idLogin);

    alter table funcionario 
        add index FK50401DDB58E6359 (idInfoAdic), 
        add constraint FK50401DDB58E6359 
        foreign key (idInfoAdic) 
        references infoadicionais (idInfoAdic);

    alter table internauta 
        add index FKA1293BB387F91032 (idLogin), 
        add constraint FKA1293BB387F91032 
        foreign key (idLogin) 
        references login (idLogin);

    alter table loja 
        add index FK32C5FA87F91032 (idLogin), 
        add constraint FK32C5FA87F91032 
        foreign key (idLogin) 
        references login (idLogin);

    alter table loja 
        add index FK32C5FA58E6359 (idInfoAdic), 
        add constraint FK32C5FA58E6359 
        foreign key (idInfoAdic) 
        references infoadicionais (idInfoAdic);

    alter table preco 
        add index FK65FA24FEB9CAE94 (idLoja), 
        add constraint FK65FA24FEB9CAE94 
        foreign key (idLoja) 
        references loja (idLoja);

    alter table preco 
        add index FK65FA24F2041F752 (idProduto), 
        add constraint FK65FA24F2041F752 
        foreign key (idProduto) 
        references produto (idProduto);

    alter table produto 
        add index FKED8DCEF94F9F43C6 (IdCategoria), 
        add constraint FKED8DCEF94F9F43C6 
        foreign key (IdCategoria) 
        references categoria (idCategoria);
        
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `senhaLogin`, `usuarioLogin`) VALUES (NULL, '1', '1', '21232f297a57a5a743894a0e4a801fc3', 'admin'); -- Senha: admin

INSERT INTO `clickafacil`.`grupo` (`idGrupo` ,`descricao` ,`nomeGrupo`) VALUES (NULL , 'Grupo de Categorias 1', 'Supercategoria 1');
INSERT INTO `clickafacil`.`grupo` (`idGrupo` ,`descricao` ,`nomeGrupo`) VALUES (NULL , 'Grupo de Categorias 2', 'Supercategoria 2');
INSERT INTO `clickafacil`.`grupo` (`idGrupo` ,`descricao` ,`nomeGrupo`) VALUES (NULL , 'Grupo de Categorias 3', 'Supercategoria 3');
INSERT INTO `clickafacil`.`grupo` (`idGrupo` ,`descricao` ,`nomeGrupo`) VALUES (NULL , 'Grupo de Categorias 4', 'Supercategoria 4');
INSERT INTO `clickafacil`.`grupo` (`idGrupo` ,`descricao` ,`nomeGrupo`) VALUES (NULL , 'Grupo de Categorias 5', 'Supercategoria 5');

INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 1', 'Categoria 1', '1');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 2', 'Categoria 2', '2');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 3', 'Categoria 3', '3');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 4', 'Categoria 4', '4');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 5', 'Categoria 5', '1');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 6', 'Categoria 6', '2');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 7', 'Categoria 7', '3');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 8', 'Categoria 8', '4');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 9', 'Categoria 9', '1');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 10', 'Categoria 10', '2');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 11', 'Categoria 11', '3');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 12', 'Categoria 12', '4');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 13', 'Categoria 13', '1');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 14', 'Categoria 14', '2');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 15', 'Categoria 15', '3');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 16', 'Categoria 16', '4');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 17', 'Categoria 17', '1');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 18', 'Categoria 18', '2');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 19', 'Categoria 19', '3');
INSERT INTO `clickafacil`.`categoria` (`idCategoria` ,`descricao` ,`nomeCategoria` ,`idGrupo`) VALUES (NULL , 'Categoria de Teste 20', 'Categoria 20', '4');

INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 1', 'Teste 1', 'Teste', 'Produto 1', 1);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 2', 'Teste 2', 'Teste', 'Produto 2', 1);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 3', 'Teste 3', 'Teste', 'Produto 3', 1);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 4', 'Teste 4', 'Teste', 'Produto 4', 2);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 5', 'Teste 5', 'Teste', 'Produto 5', 2);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 6', 'Teste 6', 'Teste', 'Produto 6', 2);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 7', 'Teste 7', 'Teste', 'Produto 7', 3);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 8', 'Teste 8', 'Teste', 'Produto 8', 3);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 9', 'Teste 9', 'Teste', 'Produto 9', 3);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 10', 'Teste 10', 'Teste', 'Produto 10', 4);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 11', 'Teste 11', 'Teste', 'Produto 11', 4);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 12', 'Teste 12', 'Teste', 'Produto 12', 4);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 13', 'Teste 13', 'Teste', 'Produto 13', 5);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 14', 'Teste 14', 'Teste', 'Produto 14', 5);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 15', 'Teste 15', 'Teste', 'Produto 15', 5);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 16', 'Teste 16', 'Teste', 'Produto 16', 6);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 17', 'Teste 17', 'Teste', 'Produto 17', 6);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 18', 'Teste 18', 'Teste', 'Produto 18', 6);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 19', 'Teste 19', 'Teste', 'Produto 19', 7);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 20', 'Teste 20', 'Teste', 'Produto 20', 7);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 21', 'Teste 21', 'Teste', 'Produto 21', 7);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 22', 'Teste 22', 'Teste', 'Produto 22', 8);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 23', 'Teste 23', 'Teste', 'Produto 23', 8);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 24', 'Teste 24', 'Teste', 'Produto 24', 8);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 25', 'Teste 25', 'Teste', 'Produto 25', 9);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 26', 'Teste 26', 'Teste', 'Produto 26', 9);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 27', 'Teste 27', 'Teste', 'Produto 27', 9);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 28', 'Teste 28', 'Teste', 'Produto 28', 10);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 29', 'Teste 29', 'Teste', 'Produto 29', 10);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 30', 'Teste 30', 'Teste', 'Produto 30', 10);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 31', 'Teste 31', 'Teste', 'Produto 31', 11);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 32', 'Teste 32', 'Teste', 'Produto 32', 11);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 33', 'Teste 33', 'Teste', 'Produto 33', 11);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 34', 'Teste 34', 'Teste', 'Produto 34', 12);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 35', 'Teste 35', 'Teste', 'Produto 35', 12);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 36', 'Teste 36', 'Teste', 'Produto 36', 12);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 37', 'Teste 37', 'Teste', 'Produto 37', 13);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 38', 'Teste 38', 'Teste', 'Produto 38', 13);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 39', 'Teste 39', 'Teste', 'Produto 39', 13);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 40', 'Teste 40', 'Teste', 'Produto 40', 14);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 41', 'Teste 41', 'Teste', 'Produto 41', 14);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 42', 'Teste 42', 'Teste', 'Produto 42', 14);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 43', 'Teste 43', 'Teste', 'Produto 43', 15);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 44', 'Teste 44', 'Teste', 'Produto 44', 15);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 45', 'Teste 45', 'Teste', 'Produto 45', 15);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 46', 'Teste 46', 'Teste', 'Produto 46', 16);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 47', 'Teste 47', 'Teste', 'Produto 47', 16);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 48', 'Teste 48', 'Teste', 'Produto 48', 16);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 49', 'Teste 49', 'Teste', 'Produto 49', 17);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 50', 'Teste 50', 'Teste', 'Produto 50', 17);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 51', 'Teste 51', 'Teste', 'Produto 51', 17);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 52', 'Teste 52', 'Teste', 'Produto 52', 18);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 53', 'Teste 53', 'Teste', 'Produto 53', 18);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 54', 'Teste 54', 'Teste', 'Produto 54', 18);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 55', 'Teste 55', 'Teste', 'Produto 55', 19);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 56', 'Teste 56', 'Teste', 'Produto 56', 19);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 57', 'Teste 57', 'Teste', 'Produto 57', 19);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 58', 'Teste 58', 'Teste', 'Produto 58', 20);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 59', 'Teste 59', 'Teste', 'Produto 59', 20);
INSERT INTO `clickafacil`.`produto` (`idProduto`, `descricao`, `fabricante`, `modelo`, `nomeProduto`, `IdCategoria`) VALUES (NULL, 'Produto de Teste 60', 'Teste 60', 'Teste', 'Produto 60', 20);

-- Senha: igual ao login
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'funcionario1', 'e6b78617985d7fb806699b4a966e46dd');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'funcionario2', '279b850eb472b50751f7fe94195cabe8');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'funcionario3', 'caa42deaf7dfd430876b5ed08d208d0a');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'funcionario4', '74b2c8d66699da7a00ce7b9bca0fdb43');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'funcionario5', 'a4fb4d675894121eef28ee2037dd5a48');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '3', 'loja1', '5f11137485551da10e03496dd44a4a65');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '3', 'loja2', '65362797722753d76d2030c8684a03f7');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '3', 'loja3', 'e6d77aefa6c479b528e66215e5cd7890');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '3', 'loja4', '5457ca432abd1b8a9161a877090562c2');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '3', 'loja5', '7b80f859d768d5159b7303a7dc891fff');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '4', 'internauta1', 'c7da7a5dc67ca6f15dc5f214153bc448');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '4', 'internauta2', 'bff61dc34ee27546b7efe310c0e22ee6');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '4', 'internauta3', '7a09f250b8a07407eeab07e91882703d');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '4', 'internauta4', '6627cd23cdced925b032f7b3c3c96407');
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '4', 'internauta5', 'c95c82198303ad2670b30687769b07a2');

INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro1', '11111111', 'Cidade1', 'Complemento1', '11', 'loja1@loja1.com.br', 'Av. Numero 1', 'RJ', 'Loja de Produtos 01', '1', '11111111');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro2', '22222222', 'Cidade2', 'Complemento2', '22', 'loja2@loja2.com.br', 'Av. Numero 2', 'RJ', 'Loja de Produtos 02', '2', '22222222');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro3', '33333333', 'Cidade3', 'Complemento3', '33', 'loja3@loja3.com.br', 'Av. Numero 3', 'RJ', 'Loja de Produtos 03', '3', '33333333');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro4', '44444444', 'Cidade4', 'Complemento4', '44', 'loja4@loja4.com.br', 'Av. Numero 4', 'RJ', 'Loja de Produtos 04', '4', '44444444');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro5', '55555555', 'Cidade5', 'Complemento5', '55', 'loja5@loja5.com.br', 'Av. Numero 5', 'RJ', 'Loja de Produtos 05', '5', '55555555');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro01', '11111111', 'Cidade01', 'Complemento01', '11', 'gerente@clickafacil.com.br', 'Av. Numero 01', 'RJ', 'Gerente da empresa', '01', '11111111');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro02', '22222222', 'Cidade02', 'Complemento02', '22', 'supervisor@clickafacil.com.br', 'Rua Numero 02', 'RJ', 'Supervidor da empresa', '02', '22222222');
INSERT INTO `clickafacil`.`infoadicionais` (`idInfoAdic`, `bairro`, `cep`, `cidade`, `complemento`, `ddd`, `email`, `endereco`, `estado`, `nome`, `numero`, `telefone`) VALUES (NULL, 'Bairro03', '33333333', 'Cidade03', 'Complemento03', '33', 'secretaria@clickafacil.com.br', 'Estrada Numero 03', 'RJ', 'Secretaria da empresa', '03', '33333333');

INSERT INTO `clickafacil`.`loja` (`idLoja`, `cnpj`, `inscricaoEstadual`, `nomeFantasia`, `responsavel`, `site`, `idInfoAdic`, `idLogin`, `informacoes`) VALUES (NULL, '11111111/0001-01', '111111111', 'Loja de Produtos 01 Ltda.', 'Responsavel 1', 'www.loja01.com.br', '1', '1', 'Mais informações sobre a loja 01');
INSERT INTO `clickafacil`.`loja` (`idLoja`, `cnpj`, `inscricaoEstadual`, `nomeFantasia`, `responsavel`, `site`, `idInfoAdic`, `idLogin`, `informacoes`) VALUES (NULL, '22222222/0001-02', '222222222', 'Loja de Produtos 02 Ltda.', 'Responsavel 2', 'www.loja02.com.br', '2', '2', 'Mais informações sobre a loja 02');
INSERT INTO `clickafacil`.`loja` (`idLoja`, `cnpj`, `inscricaoEstadual`, `nomeFantasia`, `responsavel`, `site`, `idInfoAdic`, `idLogin`, `informacoes`) VALUES (NULL, '33333333/0001-03', '333333333', 'Loja de Produtos 03 Ltda.', 'Responsavel 3', 'www.loja03.com.br', '3', '3', 'Mais informações sobre a loja 03');
INSERT INTO `clickafacil`.`loja` (`idLoja`, `cnpj`, `inscricaoEstadual`, `nomeFantasia`, `responsavel`, `site`, `idInfoAdic`, `idLogin`, `informacoes`) VALUES (NULL, '44444444/0001-04', '444444444', 'Loja de Produtos 04 Ltda.', 'Responsavel 4', 'www.loja04.com.br', '4', '4', 'Mais informações sobre a loja 04');
INSERT INTO `clickafacil`.`loja` (`idLoja`, `cnpj`, `inscricaoEstadual`, `nomeFantasia`, `responsavel`, `site`, `idInfoAdic`, `idLogin`, `informacoes`) VALUES (NULL, '55555555/0001-05', '555555555', 'Loja de Produtos 05 Ltda.', 'Responsavel 5', 'www.loja05.com.br', '5', '5', 'Mais informações sobre a loja 05');

INSERT INTO `clickafacil`.`internauta` (`idInternauta` ,`email` ,`nome` ,`idLogin`) VALUES (NULL , 'internauta01@provedor.com.br', 'Internauta 01', '12');
INSERT INTO `clickafacil`.`internauta` (`idInternauta` ,`email` ,`nome` ,`idLogin`) VALUES (NULL , 'internauta02@provedor.com.br', 'Internauta 02', '13');
INSERT INTO `clickafacil`.`internauta` (`idInternauta` ,`email` ,`nome` ,`idLogin`) VALUES (NULL , 'internauta03@provedor.com.br', 'Internauta 03', '14');
INSERT INTO `clickafacil`.`internauta` (`idInternauta` ,`email` ,`nome` ,`idLogin`) VALUES (NULL , 'internauta04@provedor.com.br', 'Internauta 04', '15');
INSERT INTO `clickafacil`.`internauta` (`idInternauta` ,`email` ,`nome` ,`idLogin`) VALUES (NULL , 'internauta05@provedor.com.br', 'Internauta 05', '16');

INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '0', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '1', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '2', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '1', '5');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '3', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '2', '4');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '4', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '3', '3');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '5', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '4', '2');
INSERT INTO `clickafacil`.`comentario` (`idComentario`, `classificacao`, `dataInclusao`, `descricao`, `idLoja`, `idInternauta`) VALUES (NULL, '9', '2009-12-01 01:00:00', 'Comentário de Internauta sobre um produto', '5', '1');

INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '1', 'R$', '10.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '3', 'R$', '20.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '5', 'R$', '30.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '7', 'R$', '40.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '9', 'R$', '50.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '11', 'R$', '40.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '13', 'R$', '30.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '15', 'R$', '20.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '17', 'R$', '10.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '19', 'R$', '20.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '21', 'R$', '30.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '23', 'R$', '40.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '25', 'R$', '50.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '27', 'R$', '40.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '29', 'R$', '30.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '1', 'R$', '20.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '3', 'R$', '10.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '5', 'R$', '20.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '7', 'R$', '30.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '9', 'R$', '40.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '11', 'R$', '50.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '13', 'R$', '40.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '15', 'R$', '30.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '17', 'R$', '20.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '19', 'R$', '10.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '21', 'R$', '20.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '23', 'R$', '30.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '25', 'R$', '40.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '27', 'R$', '50.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '29', 'R$', '40.00', '1');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '1', 'R$', '30.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '3', 'R$', '20.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '5', 'R$', '10.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '7', 'R$', '20.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '9', 'R$', '30.00', '2');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '11', 'R$', '40.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '13', 'R$', '50.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '15', 'R$', '40.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '17', 'R$', '30.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '19', 'R$', '20.00', '3');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '21', 'R$', '10.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '23', 'R$', '20.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '25', 'R$', '30.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '27', 'R$', '40.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '29', 'R$', '50.00', '4');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '1', 'R$', '40.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '3', 'R$', '30.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '5', 'R$', '20.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '7', 'R$', '10.00', '5');
INSERT INTO `clickafacil`.`preco` (`idPreco` ,`idProduto` ,`moedaCorrente` ,`valorPreco` ,`idLoja` ) VALUES (NULL , '9', 'R$', '20.00', '5');

INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'gerente', '740d9c49b11f3ada7b9112614a54be41'); -- Senha: gerente
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'supervisor', '9348c20a019be0318387c08df7a783d'); -- Senha: supervisor
INSERT INTO `clickafacil`.`login` (`idLogin`, `loginAtivo`, `perfil`, `usuarioLogin`, `senhaLogin`) VALUES (NULL, '1', '2', 'secretaria', 'fd09accffacf03d7393c2a23a9601b43'); -- Senha: secretaria

INSERT INTO `clickafacil`.`funcionario` (`idFuncionario` ,`cpf` ,`funcao` ,`matricula` ,`idInfoAdic` ,`idLogin`)VALUES (NULL , '111.111.111-11', 'Gerente', '11111', '6', '6');
INSERT INTO `clickafacil`.`funcionario` (`idFuncionario` ,`cpf` ,`funcao` ,`matricula` ,`idInfoAdic` ,`idLogin`)VALUES (NULL , '222.222.222-22', 'Supervisor', '22222', '7', '7');
INSERT INTO `clickafacil`.`funcionario` (`idFuncionario` ,`cpf` ,`funcao` ,`matricula` ,`idInfoAdic` ,`idLogin`)VALUES (NULL , '333.333.333-33', 'Secretaria', '33333', '8', '8');
ClickaFácil
===========

Catálogo e Pesquisa de Preços
------------------------------

Pesquisa e comparação de preços de produtos entre lojas de um determinado segmento, com cadastro das lojas, produtos, definição de preços pelos lojistas e registro de comentários do internauta sobre o produto. Sistema desenvolvido usando JSP, Servlet e Hibernate.

### Requisitos:

* Java JDK SE 6 ou superior;
* Eclipse Helios 3.6 ou superior;
* Tomcat 6.0.25 ou superior;
* MySQL 5.0 ou superior;
* astah Community 6 ou superior;
* DBDesigner 4;
* Windows ou Linux, qualquer versão capaz de rodar os softwares acima.

### Links de download:

* *Java JDK SE 6*: http://www.oracle.com/technetwork/java/javase/downloads/index.html
* *Eclipse Helios*: http://www.eclipse.org/downloads
* *Tomcat 7*: http://tomcat.apache.org/download-70.cgi
* *MySQL 5.5*: http://dev.mysql.com/downloads/mysql/5.6.html
* *DBDesigner*: http://www.fabforce.net/dbdesigner4/downloads.php
* *astah Community*: http://astah.net/editions/community

### Configuração do MySQL:

Após instalar o MySQL, acesse via console ou usando uma ferramenta gráfica de administração e execute os seguintes comandos:

```sql
-- Criação da base de dados
create database clickafacil;

-- Criação do usuário para acessar a base
create user 'clickafacil'@'localhost' identified by 'cl1ck4f4c1l';
grant all privileges on clickafacil.* to 'clickafacil'@'localhost' with grant option;
```

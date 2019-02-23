## Instalar R + R Studio 3.5.2
```text
http://nbcgib.uesc.br/mirrors/cran/
```
## Instalar Mysql 8.0

## Alterar linha ao arquivo my.cnf ou my.ini (depende do SO)
```text 
default_authentication_plugin=caching_sha2_password

para

default-authentication-plugin=mysql_native_password
```

## Rodar comando no Query SQL
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';
```
## Reiniciar o MySQL

## Rodar comando no Query SQL

```sql
SET GLOBAL local_infile = true;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
```

## Criar Tabelas no BD
```text
a partir do arquivo sql_dump.sql
```

## Rodar arquivo teste.r no R Studio
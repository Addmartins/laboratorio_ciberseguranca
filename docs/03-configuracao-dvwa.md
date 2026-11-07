# 3. Preparação do DVWA

O DVWA (*Damn Vulnerable Web Application*) é uma aplicação web intencionalmente vulnerável para treinamento de segurança. Deve permanecer em ambiente isolado.

## Dependências

- Apache2
- MariaDB
- PHP e extensões `mysqli`, `gd`, `xml`, `mbstring`, `curl`, `zip` e `bcmath`
- Git

## Download

```bash
cd /var/www/html
sudo git clone https://github.com/digininja/DVWA.git dvwa
```

## Permissões

```bash
sudo chown -R www-data:www-data /var/www/html/dvwa
sudo chmod -R 755 /var/www/html/dvwa
```

## Arquivo de configuração

```bash
cd /var/www/html/dvwa
sudo cp config/config.inc.php.dist config/config.inc.php
sudo nano config/config.inc.php
```

Exemplo de parâmetros (substitua a senha por uma credencial exclusiva do laboratório; não publique a senha):

```php
$_DVWA[ 'db_server' ]   = '127.0.0.1';
$_DVWA[ 'db_database' ] = 'dvwa';
$_DVWA[ 'db_user' ]     = 'dvwa';
$_DVWA[ 'db_password' ] = 'SENHA_EXCLUSIVA_DO_LAB';
```

## Banco de dados

Acesse o MariaDB administrativamente:

```bash
sudo mariadb --protocol=socket --skip-ssl
```

Exemplo SQL:

```sql
CREATE DATABASE dvwa;
CREATE USER 'dvwa'@'127.0.0.1' IDENTIFIED BY 'SENHA_EXCLUSIVA_DO_LAB';
GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'127.0.0.1';
FLUSH PRIVILEGES;
```

Se a aplicação efetivamente conectar como `localhost`, a conta correspondente também precisa existir e ter a senha alinhada. Não crie contas duplicadas sem verificar o host que aparece no erro e a configuração efetiva.

## Teste de conexão

```bash
mariadb --protocol=tcp --skip-ssl -h 127.0.0.1 -u dvwa -p dvwa
```

Digite a senha quando solicitada. Não a coloque diretamente na linha de comando.

## Acesso local

```text
http://localhost/dvwa/setup.php
```

Após a conexão estar correta, utilize o botão **Create / Reset Database** para inicializar as tabelas.

## Diagnóstico

```bash
sudo tail -n 40 /var/log/apache2/error.log
php -m
sudo systemctl status apache2 --no-pager
sudo systemctl status mariadb --no-pager
```

Durante o desenvolvimento foi observado HTTP 500, e o log mostrou `Access denied for user 'dvwa'@'localhost'`. A análise apontou divergência entre host da conta e/ou senha configurada no PHP e no MariaDB. A conexão TCP do usuário `dvwa` foi posteriormente confirmada, mas a conclusão da inicialização do DVWA deve ser registrada após validação final.

## Segurança

Não faça port forwarding do DVWA. Não exponha a aplicação vulnerável à internet. Não publique `config.inc.php`, pois ele contém credenciais.

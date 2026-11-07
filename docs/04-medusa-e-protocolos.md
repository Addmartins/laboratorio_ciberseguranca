# 4. Medusa e protocolos FTP, HTTP e SMB

## 4.1 Medusa

Medusa é uma ferramenta de auditoria de autenticação que suporta módulos para diferentes serviços. Em um teste autorizado, ela ajuda a avaliar se políticas de senha, controles de tentativas e monitoramento são suficientes.

Conceitos relevantes:

- **Módulo:** componente que implementa a interação com determinado serviço.
- **Usuário/alvo:** conta de laboratório submetida à avaliação.
- **Wordlist:** conjunto controlado de senhas fictícias para o teste.
- **Concorrência:** quantidade de tentativas simultâneas, que deve ser conservadora para evitar indisponibilidade.
- **Resultado:** autenticação aceita/rejeitada e mensagens do serviço.

Projeto oficial: https://github.com/jmk-foofus/medusa

## 4.2 Brute Force

Brute Force é a tentativa sistemática de várias senhas contra uma conta ou serviço. O risco aumenta quando há senhas fracas, ausência de limitação de tentativas e monitoramento insuficiente.

## 4.3 Password Spraying

Password Spraying testa uma ou poucas senhas contra várias contas, em vez de testar muitas senhas em uma única conta.

| Técnica | Estratégia |
|---|---|
| Brute Force | Muitas senhas contra uma conta |
| Password Spraying | Uma ou poucas senhas contra várias contas |

O fato de distribuir tentativas não torna a técnica inofensiva: ela pode comprometer várias contas e precisa ser detectada por correlação de eventos.

## 4.4 FTP — File Transfer Protocol

FTP é utilizado para transferência de arquivos entre cliente e servidor.

- Porta de controle tradicional: TCP 21.
- FTP tradicional não cifra, por padrão, credenciais e conteúdo.
- Pode permitir acesso a diretórios e arquivos conforme as permissões configuradas.

### Riscos

- Exposição de credenciais em claro no FTP tradicional.
- Acesso indevido a arquivos.
- Uso de senhas fracas ou contas anônimas mal configuradas.

### Mitigações

- Preferir SFTP ou FTPS, conforme a arquitetura.
- Desabilitar acesso anônimo quando não necessário.
- Aplicar senhas fortes e exclusivas.
- Restringir origem e permissões.
- Monitorar falhas e sucessos de autenticação.

## 4.5 HTTP — Hypertext Transfer Protocol

HTTP é o protocolo de aplicação utilizado na comunicação entre navegador e servidor web. O projeto utilizou DVWA como aplicação de treinamento.

Aspectos relevantes para autenticação web:

- Métodos HTTP, como GET e POST.
- Campos de formulário.
- Cookies e sessões.
- Respostas e códigos HTTP.
- Tokens anti-CSRF e outros controles específicos da aplicação.

A automação de um formulário web depende de sua implementação. Pode exigir cookies de sessão, tokens CSRF, parâmetros específicos e tratamento de redirecionamentos. Um módulo genérico de autenticação não necessariamente funciona em qualquer formulário.

### Riscos

- Tentativas automatizadas de login.
- Senhas previsíveis.
- Falta de limitação de tentativas.
- Gerenciamento inadequado de sessão.
- Ausência de proteção contra CSRF.

### Mitigações

- HTTPS.
- Proteção CSRF.
- Limitação de taxa e tentativas.
- Atrasos progressivos e detecção de anomalias.
- MFA.
- Hash de senhas com algoritmo apropriado, como Argon2id ou bcrypt.

## 4.6 SMB — Server Message Block

SMB é utilizado para compartilhamento de arquivos, diretórios e impressoras em redes.

- Porta TCP 445 é comum para SMB direto.
- TCP 139 pode aparecer em ambientes que utilizam NetBIOS.
- O protocolo oferece mecanismos de autenticação e controle de acesso.

### Enumeração de usuários

Enumeração é a identificação de informações sobre contas ou recursos disponíveis. A exposição excessiva dessas informações pode facilitar ataques posteriores.

### Riscos

- Descoberta de contas válidas.
- Acesso não autorizado a compartilhamentos.
- Exposição de arquivos.
- Reutilização de credenciais e movimentação lateral.

### Mitigações

- Restringir SMB a redes e hosts necessários.
- Desabilitar SMBv1.
- Aplicar menor privilégio aos compartilhamentos.
- Monitorar falhas e sucessos de autenticação.
- Utilizar senhas fortes e MFA onde suportado.
- Manter sistemas atualizados.

## 4.7 Registro dos testes realizados pelo autor

O autor informa que executou os cenários com Medusa e os protocolos FTP, HTTP/DVWA e SMB de forma independente. Para preservar a precisão técnica, complete os campos abaixo com os registros originais.

### Teste A — FTP

- Data:
- IP privado da VM de laboratório:
- Serviço/versão identificada:
- Módulo utilizado:
- Comando original (remover credenciais):
- Wordlist fictícia utilizada:
- Resultado observado:
- Como o resultado foi validado:
- Evidência em `images/evidencias-testes/`:
- Mitigação recomendada:

### Teste B — HTTP/DVWA

- Data:
- URL exclusivamente local/de laboratório:
- Funcionalidade/formulário testado:
- Método HTTP:
- Módulo ou abordagem:
- Comando original (remover credenciais, cookies e tokens):
- Como foram tratados sessão e CSRF:
- Resultado observado:
- Evidência:
- Mitigação recomendada:

### Teste C — SMB

- Data:
- IP privado da VM de laboratório:
- Serviço/versão identificada:
- Processo de enumeração realizado:
- Módulo utilizado:
- Comando original (remover credenciais):
- Estratégia de Password Spraying:
- Resultado observado:
- Como o resultado foi validado:
- Evidência:
- Mitigação recomendada:

## 4.8 Cuidados ao publicar

- Não publicar senhas válidas ou credenciais encontradas.
- Não publicar cookies, tokens CSRF ou arquivos de sessão.
- Não publicar IP público, dados pessoais ou informações de terceiros.
- Preferir capturas com dados sensíveis ocultados.
- Registrar somente resultados reproduzíveis e observados.

# 6. Mitigações e recomendações

## Controles gerais de autenticação

1. Senhas longas, fortes e exclusivas.
2. MFA sempre que disponível.
3. Limitação de tentativas e atrasos progressivos.
4. Detecção de padrões distribuídos de Password Spraying.
5. Alertas para falhas repetidas e logins anômalos.
6. Política de bloqueio cuidadosamente configurada para evitar negação de serviço por bloqueio malicioso.
7. Menor privilégio e revisão periódica de contas.
8. Atualizações de segurança.
9. Proteção de logs e retenção adequada.
10. Não reutilizar credenciais entre serviços.

## FTP

- Preferir SFTP ou FTPS.
- Desabilitar contas anônimas desnecessárias.
- Restringir acesso por firewall.
- Limitar permissões de diretórios.
- Monitorar autenticação.

## HTTP/DVWA

- Utilizar HTTPS.
- Implementar proteção CSRF.
- Aplicar rate limiting.
- Utilizar MFA quando aplicável.
- Armazenar senhas com Argon2id ou bcrypt e parâmetros adequados.
- Invalidar sessões após logout e eventos relevantes.
- Monitorar padrões de tentativa automatizada.

## SMB

- Restringir TCP 445 às redes necessárias.
- Desabilitar SMBv1.
- Aplicar menor privilégio nos compartilhamentos.
- Auditar permissões e contas.
- Monitorar autenticações e acesso a recursos.
- Manter servidores atualizados.

## Validação das mitigações

Após aplicar uma medida, repetir o teste em ambiente controlado e registrar se o controle impediu, limitou ou alertou a atividade. Não considerar um único bloqueio como prova de segurança completa.

# 1. Visão geral e arquitetura

## Contexto

Este laboratório foi criado para compreender riscos de autenticação em serviços de rede e aplicações web. A atividade combina conceitos de segurança ofensiva (simulação controlada) e defensiva (análise e mitigação).

## Objetivos de aprendizagem

1. Compreender autenticação em FTP, HTTP e SMB.
2. Diferenciar Brute Force de Password Spraying.
3. Entender enumeração de usuários.
4. Conhecer o papel da Medusa em auditorias autorizadas.
5. Relacionar falhas observadas a controles preventivos.
6. Documentar procedimentos e evidências de forma reproduzível.

## Arquitetura planejada

| Máquina | Função | Observações |
|---|---|---|
| Ubuntu host | Hospeda o VirtualBox | Não é alvo dos testes |
| Kali Linux VM | Estação de auditoria | Ferramentas de análise |
| Metasploitable 2 VM | Alvo de serviços vulneráveis | Somente rede de laboratório |
| DVWA | Aplicação web vulnerável | Acesso local/isolado |

A rede Host-Only permite comunicação entre o host e as VMs sem publicar os serviços vulneráveis na internet. Se houver necessidade de baixar atualizações, utilize temporariamente uma interface NAT separada e mantenha a interface de laboratório isolada.

## Escopo e regras

- Alvos: somente VMs criadas para o laboratório.
- Não testar endereços públicos ou sistemas de terceiros.
- Não reutilizar senhas pessoais ou corporativas.
- Não publicar credenciais, cookies, tokens ou dados pessoais.
- Registrar data, objetivo, serviço, evidência e resultado de cada teste.

## Estado do projeto

A preparação do Kali e dos serviços web foi realizada. O autor informa que executou de forma independente testes com Medusa nos cenários FTP, HTTP/DVWA e SMB. Os detalhes técnicos específicos devem ser transcritos dos registros originais para a seção de resultados, sem presumir comandos ou saídas.

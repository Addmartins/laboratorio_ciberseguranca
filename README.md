# Laboratório de Cibersegurança — Kali Linux, Medusa, FTP, HTTP e SMB

Projeto prático desenvolvido como parte de um desafio da DIO. O objetivo é estudar auditoria de autenticação, força bruta (*Brute Force*), *Password Spraying*, enumeração de usuários e medidas de mitigação em um laboratório virtual autorizado.

## Objetivos

- Preparar um laboratório virtual com Kali Linux e sistemas vulneráveis.
- Compreender os protocolos FTP, HTTP e SMB.
- Estudar Brute Force e Password Spraying.
- Utilizar Medusa em auditorias autorizadas.
- Registrar evidências, analisar resultados e propor mitigações.

## Ambiente

| Componente | Uso |
|---|---|
| Ubuntu Linux | Sistema hospedeiro |
| Oracle VirtualBox | Virtualização |
| Kali Linux | Estação de auditoria |
| Metasploitable 2 | Alvo vulnerável de laboratório |
| DVWA | Aplicação web intencionalmente vulnerável |
| Medusa | Auditoria de autenticação |
| Apache2 / PHP | Servidor e execução web |
| MariaDB | Banco de dados |
| Git | Versionamento |

A topologia prevista utiliza uma rede isolada/Host-Only entre as VMs.

## Estrutura

```text
laboratorio-ciberseguranca/
├── README.md
├── LICENSE
├── .gitignore
├── docs/
│   ├── 01-visao-geral-e-arquitetura.md
│   ├── 02-instalacao-kali.md
│   ├── 03-configuracao-dvwa.md
│   ├── 04-medusa-e-protocolos.md
│   ├── 05-resultados-e-evidencias.md
│   └── 06-mitigacoes.md
├── scripts/
│   ├── verificar-laboratorio.sh
│   └── inventario-rede-lab.sh
├── wordlists/
│   ├── README.md
│   └── exemplo-ficticio.txt
└── images/
    └── evidencias-testes/
```

## Documentação

- [Visão geral e arquitetura](docs/01-visao-geral-e-arquitetura.md)
- [Instalação do Kali Linux](docs/02-instalacao-kali.md)
- [Configuração do DVWA](docs/03-configuracao-dvwa.md)
- [Medusa e protocolos](docs/04-medusa-e-protocolos.md)
- [Resultados e evidências](docs/05-resultados-e-evidencias.md)
- [Mitigações](docs/06-mitigacoes.md)

## Execução dos scripts

No Kali, a partir da raiz do repositório:

```bash
chmod +x scripts/*.sh
./scripts/verificar-laboratorio.sh
```

O inventário de rede é apenas informativo e mostra interfaces/endereço local:

```bash
./scripts/inventario-rede-lab.sh
```


## Segurança e autorização

Este projeto é exclusivamente educacional. Executado somente em testes em máquinas próprias, dentro de uma rede isolada. Não utilizei wordlists de vazamentos nem credenciais reais. Não publiquei credenciais válidas, arquivos de configuração com senhas ou evidências que exponham dados sensíveis.

## Referências

- Kali Linux: https://www.kali.org/
- Medusa: https://github.com/jmk-foofus/medusa
- DVWA: https://github.com/digininja/DVWA
- Metasploitable 2: https://docs.rapid7.com/metasploit/metasploitable-2/
- Apache HTTP Server: https://httpd.apache.org/
- MariaDB: https://mariadb.org/
- SMB protocol: https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb/
- HTTP Semantics (RFC 9110): https://www.rfc-editor.org/rfc/rfc9110

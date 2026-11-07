# 2. Instalação e preparação do Kali Linux

## Ambiente

- Sistema hospedeiro: Ubuntu Linux.
- Virtualizador: Oracle VirtualBox.
- Sistema convidado: Kali Linux 64-bit.
- Inicialização utilizada na nova VM: BIOS Legacy.
- Particionamento: assistido, todos os arquivos em uma partição.
- Disco: novo disco virtual, separado do Ubuntu hospedeiro.

Foi realizada uma instalação limpa do Kali em um disco virtual novo. A escolha preservou o sistema operacional hospedeiro.

## Verificações iniciais

```bash
whoami
sudo whoami
sudo apt update
```

O teste de `sudo whoami` deve retornar `root`.

## Instalação dos serviços web

```bash
sudo apt update
sudo apt full-upgrade -y

sudo apt install apache2 mariadb-server php php-mysqli php-gd \
php-xml php-mbstring php-curl php-zip php-bcmath git -y
```

## Inicialização e validação

```bash
sudo systemctl enable --now apache2
sudo systemctl enable --now mariadb

systemctl status apache2 --no-pager
systemctl status mariadb --no-pager
```

Durante a preparação, Apache2 e MariaDB foram confirmados como `active`.

## Problemas de instalação investigados

### Permissões do sudo

Foi observado erro informando que `/usr/bin/sudo` não tinha proprietário UID 0 e/ou bit setuid adequado. A instalação foi reconstruída em uma nova VM.

### Inicialização UEFI/GRUB

A VM antiga chegava ao UEFI Interactive Shell e não apresentava sistemas de arquivos EFI acessíveis. Foi criada uma nova instalação em disco virtual separado, utilizando BIOS Legacy.

### TLS/SSL no MariaDB

A conexão local inicial apresentou erro TLS. O acesso administrativo por socket funcionou com:

```bash
sudo mariadb --protocol=socket --skip-ssl
```

O uso dessa opção foi uma forma de diagnóstico da conexão local, não uma correção genérica para toda conexão MariaDB.

## Evidências a adicionar

- Captura da tela de login do Kali.
- Saída dos serviços Apache2 e MariaDB ativos.
- Saída do script `scripts/verificar-laboratorio.sh`.

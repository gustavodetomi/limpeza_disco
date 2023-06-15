#!/bin/bash

# Limpa arquivos antigos em /tmp
sudo find /tmp -type f -atime +7 -delete

# Limpa o cache do APT
sudo apt-get clean

# Limpa arquivos antigos de logs em /var/log
sudo find /var/log -type f -name '*.log' -mtime +7 -delete

# Limpa a lixeira do usuário atual
rm -rf ~/.local/share/Trash/*

# Limpa o cache do navegador Google Chrome
rm -rf ~/.cache/google-chrome/Default/Cache/*

# Limpa o cache do navegador Firefox
rm -rf ~/.cache/mozilla/firefox/*.default-release/cache/*

# Limpa o cache do Docker
sudo docker system prune -af

# Remove pacotes não utilizados
sudo apt-get autoremove --purge -y

# Limpa o histórico do shell
cat /dev/null > ~/.bash_history
history -c

# Reinicia o serviço syslog para liberar espaço em disco ocupado por arquivos de log abertos
sudo service rsyslog restart

# Reinicia o serviço da máquina virtual
sudo reboot

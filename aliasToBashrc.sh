alias update="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove && sudo apt clean"

# Esse último alias determina se minha programaçao no crontab resultará no desligamento do meu sistema ou não
alias shutd='if [ -e ~/shut.down ]; then rm ~/shut.down && echo "Sistema não será mais desligado automaticamente"; else touch ~/shut.down && echo "Sistema será desligado automaticamente"; fi'

# Utilities

## Descrição dos scripts:
- **hdInUsing.sh:** Retorna 0 ou 1. No caso de retornar 0, o script quer dizer que o hd **não** está sendo utilizado, o inverso é verdadeiro;
- **netInUsing.sh:** Retorna 0 ou 1. No caso de retornar 0, o script quer dizer que **não** há tráfego de rede através do seu sistema, o inverso é verdadeiro;
- **aliasToBashrc.sh:** Alias à serem adicionados no arquivo .bashrc, presente no diretório do seu usuário. Contém um alias que depende diretamente do script abaixo;
- **shut.sh:** Faz o sistema ser desligado, caso o HD e o tráfego de rede não estejam sendo utilizados (ou em pouquíssima utilização). Depende diretamente dos scripts **hdInUsing.sh** e **netInUsing.sh**. 
## Dependências e Permissões necessárias para funcionamento:
- Para **todos**: Ter bash executável.
- **hdInUsing.sh:** Ter no sistema o pacote iotop. Para plena execução é necessário permissão de ROOT para executar, devido à necessidade do iotop;
- **netInUsing.sh:** Ter no sistema o pacote ifstat. Não é necessário permissão de ROOT para execução;
- **shut.sh:** Ter no sistemas ambos pacotes mencionados acima. É necessário permissão de ROOT para executar o script **hdInUsing.sh** e para poder desligar a máquina.
## Testado no sistema:
- Ubuntu 22.04.4 LTS (GNU/Linux 5.15.0-112-generic x86_64).

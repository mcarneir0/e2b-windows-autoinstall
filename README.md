# E2B Windows Autoinstall

Um conjunto de arquivos de configuração e scripts para automatizar a instalação do Windows 10

## Introdução

Este projeto tem como objetivo auxiliar o usuário no processo de instalação do Windows, pulando etapas de configuração e instalando programas básicos do dia-a-dia.

O ponto forte aqui é a modularidade, ou seja, é possível alterar partes da configuração de forma simples e independente, sem afetar o funcionamento do script. Por exemplo: você pode usar uma ISO diferente do Windows 10 sem modificar nada nos scripts, ou atualizar e adicionar aplicativos em apenas 2 passos: adicionar o arquivo de instalação```.exe ou .msi```na pasta correta e alterar sua entrada no script```install_apps.cmd```como veremos adiante.

## Pré-requisitos

- Pendrive de boot feito com o [Easy2Boot](https://www.easy2boot.com)
- ISO de instalação do Windows 10 (Veja como obter uma na seção [Extras](#Extras))
- Arquivos deste repositório

## Como usar

Prepare o pendrive usando o Easy2Boot (veja como fazer isso [aqui](https://www.easy2boot.com/make-an-easy2boot-usb-drive/)). **Durante o processo a ferramenta oferece a opção de utilizar o Ventoy na 2ª partição, selecione NÃO pois o Ventoy não suporta configuração XML do Windows, o que é necessário para o script funcionar corretamente.**

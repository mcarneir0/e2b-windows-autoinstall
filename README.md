# E2B Windows Autoinstall

> Um conjunto de arquivos de configuração e scripts para automatizar a instalação do Windows 10

## Introdução

Este projeto tem como objetivo auxiliar o usuário no processo de instalação do Windows, pulando etapas de configuração e instalando programas básicos do dia-a-dia.

Com foco em modularidade, é possível alterar partes da configuração de forma simples e independente, sem afetar o funcionamento do script. Por exemplo, você pode usar uma ISO diferente do Windows 10 sem a necessidade de modificar os scripts, ou atualizar e adicionar aplicativos em apenas 2 passos: adicionar o arquivo de instalação```.exe ou .msi```na pasta correta e alterar sua entrada no script```install_apps.cmd```como veremos adiante.

## Pré-requisitos

- Pendrive de boot feito com o [Easy2Boot](https://www.easy2boot.com)
- ISO de instalação do Windows 10 (veja como obter uma na seção [FAQ](#FAQ))
- Arquivos deste repositório

## Como usar

1. Prepare o pendrive usando o Easy2Boot (veja como fazer isso [aqui](https://www.easy2boot.com/make-an-easy2boot-usb-drive/)).

   > **Durante o processo a ferramenta oferece a opção de utilizar o Ventoy na 2ª partição, selecione NÃO pois o Ventoy não suporta configuração XML do Windows, o que é necessário para o script funcionar corretamente;**

2. Faça download dos arquivos deste repositório e cole na partição _E2B_ do seu pendrive;

3. Adicione a ISO do Windows 10 na pasta```_ISO\WINDOWS\WIN10```para ISO _single boot_ (x32 ou x64 apenas) ou na pasta```_ISO\WINDOWS\WINAIO```para ISO _dual boot_ (x32 e x64 na mesma ISO);

4. Dê boot pelo pendrive:

   4.1 **Modo Legacy (CSM):** No menu do Easy2Boot selecione a opção _Instalação do Windows_ > selecione _Windows 10_ para _single boot_ ou _Windows AIO_ para _dual boot_ > selecione a ISO para instalação. Ignore qualquer mensagem de _pressione Enter_, exceto no caso de ISO _dual boot_ onde é perguntado se deseja instalar a versão x32 ou x64;

   4.2 **Modo UEFI:** No menu do a1ive grub2 File Manager (agFM) selecione a opção _Windows Install_ > semelhante ao _modo legacy_, selecione a pasta _WIN10_ ou _WINAIO_ > selecione a ISO para instalação > _Boot Windows install from ISO_ > em ISO _dual boot_ selecione a versão x64 (x32 funciona somente no _modo legacy_);

   > **IMPORTANTE: no modo UEFI é necessário desativar temporariamente o _SECURE BOOT_ no BIOS antes de iniciar o pendrive, após a instalação do Windows você pode ativar novamente.**

5. Faça a instalação do Windows normalmente, selecionando a versão e criando partições conforme necessário. Ao finalizar esta parte o computador irá reiniciar, caso a tela do E2B ou agFM apareça novamente aperte a tecla F7 (E2B) ou F6 (agFM) para prosseguir com o boot no HD/SSD;

   > **NÃO REMOVA o pendrive até que apareça um prompt na tela com o fundo verde e as teclas _Caps Lock_ e _Scroll Lock_ estejam ativas, esse é o sinal de que a 1ª parte do script finalizou com sucesso e que já é possível remover o pendrive e o computador irá reiniciar novamente.**

6. O Windows irá iniciar na configuração inicial, insira o nome de usuário e senha (opcional) e clique em avançar. Ao final do processo o script irá chamar o```install_apps.cmd```e iniciar a instalação dos programas e finalizar o _E2B Windows Autoinstall_.

## Agradecimentos

- [Easy2Boot](https://www.easy2boot.com) pela excente ferramenta multiboot e seus recursos;
- [Windows Answer File Generator](https://www.windowsafg.com) pela ferramenta de criação de```unattend.xml```para pré-configuração do Windows;
- [Notepad++](https://notepad-plus-plus.org) por me poupar de muito esforço com sua excelente ferramenta de edição de arquivos;
- [Get IT Solutions](https://www.get-itsolutions.com/applications-silent-install-complete-list/) pela ajuda com os parâmetros de instalação silenciosa.

## FAQ

- **Como obter uma ISO do Windows?**

   Neste [link](https://www.microsoft.com/pt-br/software-download/windows10) você encontra a ferramenta de criação de ISO oficial da Microsoft. Clique em _Baixar a ferramenta agora_, execute a ferramenta e siga as instruções na tela.

- **Porque preciso usar o Easy2Boot para isso?**

   O E2B é uma excelente ferramenta, além de proporcionar uma instalação automática e personalizada do Windows ela é MULTIBOOT! Ou seja, você pode adicionar ISOs do Linux, WinPE, Rescue CDs e etc. Um bônus: o E2B vem com memtest86+ para diagnosticar problemas de RAM. :-)

- **Posso remover ou adicionar algum programa para instalação automática?**

   Sim! Você pode editar livremente os programas, adicionando ou removendo o que desejar, basta adicionar o arquivo na pasta Programas e editar o arquivo ```_ISO\WINDOWS\installs\CONFIGS\SDI_CHOCO\install_apps.cmd```. Dê uma olhada nele para mais instruções.

- **Como faço para o script copiar arquivo(s) de um lugar para outro?**

   Adicione o comando [xcopy](https://ss64.com/nt/xcopy.html) no```install_apps.cmd```.

- **Posso usar esse script para automatizar uma instalação do Windows 7/8.1?**

   Esse script foi testado apenas com ISOs do Windows 10 2004 e 20H2, mas nada impede que você teste em outras versões ou faça alterações para outros Windows.

## Licença
[MIT](https://choosealicense.com/licenses/mit/)

# Instalando o linux na DragonBoard - flashing linux using fastboot
Para quem adquiriu a DragonBoard410c, normalmente ela vem com o sistema Android instalado. Se você deseja fazer um upload do sistema operacional Debian Linux, segue um passo a passo:

Se tudo der certo, este procedimento (fastboot) total dura em torno de 10 minutos após download da imagem.

## Hardware necessário
- Dragonboard410c
- Cabo usb/mini usb ( aquele que usamos para carregar o celular)
- Cabo HDMI (para conectar placa em um monitor ou TV)
- Monitor HDMI ou SmartTV
- teclado/mouse sem fio
- computador host para carregar os arquivos, usei Mac/Linux

## Software no computador host - para baixar os arquivos, você precisa de um computador que chamamos de host com :
- Sistema operacional linux ou OSX 

## Passo 1 - Preparar os arquivos com imagem do linux
- crie uma pasta (ex.: dragonlinux) e baixe os seguintes arquivos  
1.1 - dragonboard410c_bootloader_emmc_linux-79.zip -> http://builds.96boards.org/releases/dragonboard410c/linaro/rescue/latest/dragonboard410c_bootloader_emmc_linux-*.zip  
1.2 - boot-linaro-stretch-qcom-snapdragon-arm64-20170510-233.img.gz -> http://builds.96boards.org/releases/dragonboard410c/linaro/debian/latest/boot-linaro-*-qcom-snapdragon-arm64-*.img.gz  
1.3 - linaro-stretch-alip-qcom-snapdragon-arm64-20170510-233.img.gz -> http://builds.96boards.org/releases/dragonboard410c/linaro/debian/latest/linaro-*-alip-qcom-snapdragon-arm64-*.img.gz  


## Passo 2 - montando a pasta
- descompacte todos os 3 arquivos baixados e coloque-os dentro da mesma pasta. (ex: dragonlinux)
- de um "ls" e verifique se sua pasta contem os seguintes arquivos: 
LICENSE  
MD5SUMS.txt  
NON-HLOS.bin  
boot-linaro-stretch-qcom-snapdragon-arm64-20170510-233.img  
emmc_appsboot.mbn  
flashall  
gpt_both0.bin  
hyp.mbn  
linaro-stretch-alip-qcom-snapdragon-arm64-20170510-233.img  
rpm.mbn  
sbc_1.0_8016.bin  
sbl1.mbn  
tz.mbn  

## Passo 3- editar o arquivo flashall com o seguinte conteúdo:
#!/bin/sh

$fastboot flash partition gpt_both0.bin  
$fastboot flash hyp hyp.mbn  
$fastboot flash rpm rpm.mbn  
$fastboot flash sbl1 sbl1.mbn  
$fastboot flash tz tz.mbn  
$fastboot flash aboot emmc_appsboot.mbn  
$fastboot flash cdt sbc_1.0_8016.bin  

$fastboot erase boot  
$fastboot erase rootfs  
$fastboot erase devinfo  

$fastboot flash boot boot-linaro-stretch-qcom-snapdragon-arm64-20170510-233.img  
$fastboot flash rootfs linaro-stretch-alip-qcom-snapdragon-arm64-20170510-233.img  


## Passo 4 - digitar o seguinte comando
export fastboot=~/Library/Android/sdk/platform-tools/fastboot 

## Passo 5 - Boot em fastmode - placa dragonboard
1- Conectar o cabo mini-usb na placa e a outra extremidade na usb do seu computador (aquele cabo que usamos para carregar o celular).  
2- Com o cabo de energia desplugado, pressionar o botão de volume (-) e em seguida plugar o cabo de energia e esperar cerca de 10segundos

## Passo 6 - verificar se disposto usb conectou
comando: $fastboot devices  
resultado: 3de82e08	fastboot  (ou algo parecido)

## Passo 7 - executar o script
./flashall 


Dúvidas?
mande email com assunto [duvida-fastboot-dragonboard410c] para alexsalgado1@gmail.com

Referências:
1 - Instalando Linux na DragonBoard - http://www.96boards.org/documentation/ConsumerEdition/DragonBoard-410c/Downloads/Debian.md/, ultimo acesso 27/05/2017
2 - https://geeksww.com/tutorials/operating_systems/linux/installation/downloading_compiling_and_installing_cmake_on_linux.php
3 - https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz


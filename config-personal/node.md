# Node para Fedora:
- Tratar de instalar una version anterior de la stable actual

## Problemas con **node** en 'react-native'
- problemas con el comando **'npx react-native start'**
- se soluciona instalando una version soportada, lts anterios de preferencia
- si no se puede con la paqueteria oficial recurrir a snap, 'visto en de android studio'
- instalar **node** con **snap**:
  * sudo snap install **node**  --channel=15/stable --classic
    - dice que estan 'LTS incluido, pero no se como poner la version especifica'
  * para cambiar de channel (version):
    - sudo snap refresh node --channel=15/stable --classic
- los detalles se encuentran el github: **nodejs/quebrar**

## Dependencias para cmp lsp

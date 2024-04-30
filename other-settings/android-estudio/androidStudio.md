# Requisitos:
* Tener Java SDK, biene por default en **Fedora**.
* Recurri a los packetes snap, ya que no estaba en su tienda como en **PosOS**, y era mas faci.
   - sudo dnf install snapd
   - sudo reboot || init 6
   - sudo ln -s /var/lib/snapd/snap /snap
   - Para crear un enlace simbolico.
   - sudo snap install android-studio --classic
   - Esta es la Instalacion **...end...**

## crear facil apk desde React-native
cd android/ && ./gradlew assembleRelease
el apk esta en la ruta android/app/build/outputs/apk/release/app-release.apk

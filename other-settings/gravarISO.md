## verificamos los medios de almacenaliento
* **sudo** lsblk
* Desmontamos alguna la unidad a gravar:
   - **sudo** umount /media/usr....
* Grabamos la ISO:
   - **sudo** dd if=Iso of=/dev/sd(destino) bs=4M status=progress
* expulsamos el medio:
   - **sudo** eject /dev/sd(destino)

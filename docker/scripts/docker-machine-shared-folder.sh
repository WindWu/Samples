#!env bash

: ${MACHINE_NAME:=default}
: ${HOSTPATH:=d:\\gitroot}
: ${SHARE_NAME:=d/gitroot}
: ${MOUNT:=/d/gitroot}
: ${VBOX_MANAGE=/C/Program Files/Oracle/VirtualBox/VBoxManage.exe}
: ${SCRIPT=/mnt/sda1/var/lib/boot2docker/bootlocal.sh}

set -x

docker-machine stop $MACHINE_NAME
"$VBOX_MANAGE" sharedfolder add $MACHINE_NAME --name $SHARE_NAME --hostpath $HOSTPATH --automount 2>/dev/null || :
docker-machine start $MACHINE_NAME
docker-machine env $MACHINE_NAME
eval $(docker-machine env $MACHINE_NAME)
docker-machine ssh $MACHINE_NAME 'echo "mkdir -p '"$MOUNT"'" | sudo tee '"$SCRIPT"
docker-machine ssh $MACHINE_NAME 'echo "mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` '"$SHARE_NAME"' '"$MOUNT"'" |  sudo tee -a '"$SCRIPT"
docker-machine ssh $MACHINE_NAME "sudo sh $SCRIPT"

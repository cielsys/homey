#!/usr/bin/env bash

UNC_REMOTE=//scarecrow0.local/homes
MOUNT_POINT=~/mounts/scarecrow0

# the uid= is required if you want the mount to be writable, oddly
LOCAL_UID=$USER

# If the dir doesn't exist
if [ ! -d "$MOUNT_POINT" ]; then
    echo "Mount point doesn't exist. Try mkdir -p $MOUNT_POINT"
    exit -1
fi

# If it's already mounted
if mountpoint -q  "$MOUNT_POINT" ; then
    echo "Already mounted! Try unmounting with"
    echo "sudo umount $MOUNT_POINT"
    exit -1
fi


echo "mounting $UNC_REMOTE to $MOUNT_POINT"


sudo mount -t cifs $UNC_REMOTE $MOUNT_POINT -o user=cl,password=hasbrain,uid=$LOCAL_UID

echo "unmount with: sudo umount $MOUNT_POINT"

lsblk - see the disk
******create the partition*************

fdisk  /dev/nvme0n2 - provide the disk name
n => new
p=> primary partition
1=> to get the entire partition
t=
8e=
w = save the changes
partprobe => kernal can read the changes
to check the partition lsblk

create the physical volume
pvcreate  dev/nvme02n2p1
y

create the volume group
vgcreate vg /dev/nvme02n2p1

create the logical volume
lvcreate -L  3G -n lv LogicalVGName

check the logical volume group
lvs

check the volume group
vgs

mke2fs command to use ext2 and ext3 file system

mke2fs dev/vg/lv

command to see the file system of logical volume
blkid /dev/vg/lv

mount the logical volume
mount /dev/vg/lv /mnt

check the file system df -hT
unmount the logical volume 
umount /mnt

ext2 file system is not supporting the journaling feature
tune2fs -l /dev/vg/lv | grep feature //check the feature of the file system

to enable the journling featue 
tunne2fs -j /dev/vg/lv

tune2fs -l /dev/vg/lv | grep feature
blkid /dev/vg/lv
mount /dev/vg/lv /mnt
cd /mnt
ll

umount /mnt

convert ext3 to ext4 file system
tune2fs -0 extents,uninit_bg,dir_inndex /dev/vg/lvcreate
blkid /dev/vg/lv
lsblk -f

mount dev/vg/lv /mnt

ext3 and ext4 supports the journaling feature

remove the journaling featue on ext3 and ext4 file system
unmount /mnt
tune2fs -0 ^has_journal /dev/vg/lv // remove journaling feature

tune2fs -0 has_journal /dev/vg/lv // add journaling feature































# C:\Windows\System32\drivers\etc\hosts
192.168.220.129 ansible.kuber.local
192.168.220.131 master.kuber.local
192.168.220.132 control1.kuber.local
192.168.220.133 control2.kuber.local
192.168.220.134 control3.kuber.local
192.168.220.136 worker1.kuber.local
192.168.220.135 worker2.kuber.local
192.168.220.137 worker3.kuber.local

# copy ssh with ansible host
ssh-keygen -t rsa 2048
ssh-copy-id root@master.kuber.local
ssh-copy-id root@ansible.kuber.local

ssh-copy-id root@control1.kuber.local
ssh-copy-id root@control2.kuber.local
ssh-copy-id root@control3.kuber.local
ssh-copy-id root@control4.kuber.local

ssh-copy-id root@worker1.kuber.local
ssh-copy-id root@worker2.kuber.local
ssh-copy-id root@worker3.kuber.local

# ssh login
ssh root@master.kuber.local
ssh root@ansible.kuber.local

ssh root@control1.kuber.local
ssh root@control2.kuber.local
ssh root@control3.kuber.local

ssh root@worker1.kuber.local
ssh root@worker2.kuber.local
ssh root@worker3.kuber.local

# Для kubernates 1.32.2 необходимо обновить ядро для RockyLinux на 5.x +
sudo dnf install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
sudo dnf --enablerepo=elrepo-kernel install kernel-ml -y
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
grubby --update-kernel=ALL --args="cgroup_enable=cpuset"
vim /etc/default/grub
# добавить systemd.unified_cgroup_hierarchy=1 cgroup_no_v1=all в файл /etc/default/grub:
GRUB_CMDLINE_LINUX="... systemd.unified_cgroup_hierarchy=1 cgroup_no_v1=all ..."

sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot

#Проверить что cgroup v2 cgroup2fs
stat -fc %T /sys/fs/cgroup/ 

uname -r
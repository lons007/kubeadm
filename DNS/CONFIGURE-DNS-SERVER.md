# устанавливаем имя хоста, например master.kuber.local
hostnamectl set-hostname master.kuber.local

# настраиваем /etc/named.conf
vim /etc/named.conf

# создаем файлы
vim /var/named/200
vim /var/named/kuber.local

# меняем владельца и группу
chown root:named /var/named/200
chown root:named /var/named/kuber.local

# задаем права на файлы
chmod 640 /var/named/kuber.local
chmod 640 /var/named/200

# Настраиваем firewall
firewall-cmd --permanent --add-service=dns
firewall-cmd --reload

# на клиентах в /etc/resolve.conf добавляем ip dns сервера
nameserver 192.168.220.131
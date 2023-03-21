
https://www.howtoforge.com/how-to-setup-local-dns-server-using-dnsmasq-on-ubuntu-20-04/

systemctl disable --now systemd-resolved

rm -rf /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf


vi  /etc/hosts


systemctl status dnsmasq



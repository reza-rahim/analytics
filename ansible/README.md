
systemctl --host minio-node-1 stop minio; systemctl --host minio-node-2 stop minio; systemctl --host minio-node-3 stop minio;systemctl --host minio-node-4 stop minio;

ssh minio-node-1  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde;  ssh minio-node-2  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde; ssh minio-node-3  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde; ssh minio-node-4  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde;


systemctl --host minio-node-1 start minio; systemctl --host minio-node-2 start minio; systemctl --host minio-node-3 start minio;systemctl --host minio-node-4 start minio;

journalctl -f -u minio.service


ssh minio-node-2 -L 9001:localhost:9001


curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add -

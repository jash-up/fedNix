so im tryna get fedora and nix to work, i might swithc to nix completely again or arch with nix if fedora asks for age verificaiton asndf shit tho.

so for syncthing, i set the firewall settings through fedora as we're not on nixos, all good and fine tho
sudo firewall-cmd --add-service=syncthing --permanent
sudo firewall-cmd --reload

should open 22000 for syncthing and 21027/udp as well, defualt 

and this cuz chatgpt said to do:
loginctl enable-linger $USER

yea thats about it, it opens on localhost:8384 ig

Setinng up samba and smb on fedora directly, cuz its better on system directly, this is what i ddi:
1. Install samba
2. give perms to directory ig: sudo chcon -Rt samba_share_t smbShare
3. backup smb.conf: sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.backup
4. edit the smb.conf file and add this:
[smbShare]
path = /home/your_username/smbShare
    valid users = ash
    read only = no
    browsable = yes
    guest ok = no

5. Creating a smb passwd
6. firewall and perm stufF:
# Allow Samba through the firewall
sudo firewall-cmd --add-service=samba --permanent
sudo firewall-cmd --reload

# Start and enable the Samba services
sudo systemctl enable --now smb nmb

# for uxplay
sudo dnf install avahi
sudo systemctl enable --now avahi-daemon

sudo firewall-cmd --permanent --add-service=mdns
sudo firewall-cmd --permanent --add-port=7000/tcp --add-port=7001/tcp --add-port=7100/tcp
sudo firewall-cmd --permanent --add-port=6000/udp --add-port=6001/udp --add-port=7011/udp
sudo firewall-cmd --reload


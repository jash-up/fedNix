so im tryna get fedora and nix to work, i might swithc to nix completely again or arch with nix if fedora asks for age verificaiton asndf shit tho.

so for syncthing, i set the firewall settings through fedora as we're not on nixos, all good and fine tho
sudo firewall-cmd --add-service=syncthing --permanent
sudo firewall-cmd --reload

should open 22000 for syncthing and 21027/udp as well, defualt 

and this cuz chatgpt said to do:
loginctl enable-linger $USER

yea thats about it, it opens on localhost:8384 ig

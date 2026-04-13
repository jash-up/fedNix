{ config, pkgs, lib, inputs, ... }:


{
  home.stateVersion = "25.11";
  home.username = "ash";
  home.homeDirectory = "/home/ash";

  imports = [
    inputs.zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;
  };

  programs.home-manager.enable = true;
   
  home.packages = with pkgs; [
    fastfetch
    #git
    neovim
    proton-vpn 

    keepassxc
    obsidian
    discord
    cmatrix
    wget
    tmux
    vlc
    transmission_4-gtk
    nemo
    ranger
    peaclock
    gparted
    bat
    htop
    libreoffice-still
    calibre
    cava
    qpdf
    obs-studio
    telegram-desktop
    audacity
    feh
    google-chrome
    github-copilot-cli
    anki-bin
    android-tools
    metasploit
    scrcpy
    nmap
    zathura

  ];

  services.ssh-agent.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "jash-up";
      user.email = "asharnav2008@gmail.com";
      init.defaultBranch = "main";
      core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
    };

    #delta.enable = true;
  };

  programs.delta.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
      "*" = {
        extraOptions = {
          "HashKnownHosts" = "yes";
        };
      };
    };
  };

  # syncthng
  services.syncthing = {
    enable = true;
    #user = "ash";
    #group = "users";
    #dataDir = "/home/ash/.config/syncthing";
  };

}

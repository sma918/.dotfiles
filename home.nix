{ config, pkgs, lib, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello
  ];

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };

    ".config/mango/config.conf" = {
      source = ./mango/config.conf;
      recursive = true;
    };
  };

  xdg.configFile."kitty/kitty.conf".source = ./kitty/kitty.conf;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -al";
      ssh-server = "ssh sam@192.168.4.137";
    };
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "sma918";
      email = "sam.baxter918@gmail.com";
    };
  };

  # MangoWM config
 # wayland.windowManager.mango = {
 #   enable = true;
 #   autostart_sh = ''
 #     waybar &
 #   '';
 #   settings = {
 #     bind = [
 #     "SUPER,t,spawn,kitty"
 #     "SUPER,r,reload_config"
 #     "SUPER,c,killclient"
 #     "SUPER,b,spawn,librewolf"
 #     "SUPER+SHIFT,q,quit"
 #     ];
 #   };
 # };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

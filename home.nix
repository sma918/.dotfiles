{ config, pkgs, lib, inputs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello
    pkgs.mpd
    pkgs.mpc
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

    ".config/waybar" = {
      source = ./waybar;
      recursive = true;
    };
  };

  xdg.configFile."kitty/kitty.conf".source = ./kitty/kitty.conf;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Noctalia
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = {
      bar.main = {
        position = "top";
        enabled = true;
        background-opacity = 1.0;
        shadow = false;
        contact_shadow = false;
      };
      dock = {
        enabled = true;
        position = "left";
        monitors = ["DP-2"];
        shadow = false;
        smart_auto_hide = true;
        reserve_space = false;
        show_dots = true;
        show_instance_count = false;
        border = "outline";
        border_width = 5;
        margin_edge = 5;
        magnification_scale = 1.2;
        concave_edge_corners = false;

        pinned = [ "librewolf" "steam" ];
      };
      shell.panel = {
        shadow = false;
      };
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
      };
      wallpaper = {
        enabled = true;
        fill_mode = "crop";
        directory = "/home/sam/Pictures/Wallpapers/";
        default = "/home/sam/Pictures/Wallpapers/ark-m.jpg";
      };
    };
  };

  services.mpd = {
   enable = true;
   dbFile = "${config.home.homeDirectory}/.config/mpd/database";
   dataDir= "${config.home.homeDirectory}/.config/mpd";
   musicDirectory = "/home/sam/Music";
   playlistDirectory = "/home/sam/mpd/playlists";
   extraConfig = ''
    audio_output {
      type "pipewire"
      name "pipewire output"
    }
   '';
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
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

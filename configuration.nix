{ config, pkgs, lib, system, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 6;
      useOSProber = true;
    };
    systemd-boot = {
      enable = false;
    };
    efi.canTouchEfiVariables = true;
  };
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_12;

  networking.hostName = "nixos";

 #musnix.enable = true;
 #musnix.kernel.realtime = true;
 #musnix.rtirq.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.usbmuxd.enable = true;

  # ZSH
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  environment.pathsToLink = [
    "/lib/lv2"
  ];

  environment.variables= {
    LV2_PATH = "/run/current-system/sw/lib/lv2";
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  # Sound 
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # GPU Stuff
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  hardware.nvidia.modesetting.enable = true;

  # User Account (homemanager later)
  users.users."sam" = {
    isNormalUser = true;
    description = "Sam";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      spotify
    ];
  };

  # Enable Applications
  programs.firefox.enable = true;
  programs.neovim.enable = true;
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      kdePackages.breeze
      ];
  };
  programs.mango.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
   cmake
   fastfetch
   gcc
   git
   gnumake
   guitarix
   ifuse
   kitty
   libimobiledevice
   librewolf
   neovim
   nerd-fonts.hack
   neural-amp-modeler-lv2
   pkg-config
   prismlauncher
   protonup-qt
   proton-vpn
   qjackctl
   reaper
   rmpc
   tor-browser
   vim
   waybar
   wget
   wofi
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  system.stateVersion = "26.05";

  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes" ];
}

{ config, pkgs, lib, ... }:
{
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

    nix.gc.automatic = true;
    nix.gc.persistent = true;
    nix.gc.options = "--delete-older-than 7d";

    services.automatic-timezoned.enable = true;
    services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";

    users.users.emily = {
        isNormalUser = true;
        description = "emily";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
        packages = with pkgs; [
        ];
        shell = pkgs.zsh;
    };

    programs.zsh = {
        enable = true;
        ohMyZsh = {
            enable = true;
        };
    };

    # Enable OpenGL
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;
    };

    # Install firefox.
    programs.firefox.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
}


{
    description = "My lil NixOS configy :3";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        home-manager = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "github:nix-community/home-manager";
        };
        cscopes-plugin = {
            type = "file";
            url = "file+http://cscope.sourceforge.net/cscope_maps.vim";
            flake = false;
        };
        badwolf-theme = {
            type = "file";
            url = "file+https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim";
            flake = false;
        };
    };
    outputs = inputs@{ self, nixpkgs, ... }: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                ./system_config.nix
                ./system_packages.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.emily = ./home.nix;
                    home-manager.extraSpecialArgs = { inherit inputs; };

                    # Optionally, use home-manager.extraSpecialArgs to pass
                    # arguments to home.nix
                }
                ./home_manager.nix
            ];
        };
    };
}


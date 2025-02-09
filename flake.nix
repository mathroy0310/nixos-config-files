{
  description = "Mathroy0310's nixos configuration";

  inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows ="nixpkgs";	
	};	

  spicetify-nix = {
    url =  "github:gerg-l/spicetify-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

	zen-browser.url = "github:0xc000022070/zen-browser-flake";

  zig.url = "github:mitchellh/zig-overlay";
  };

  outputs = { nixpkgs, self, ...}@inputs:
  let
    username = "mathroy";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/vm ];
        specialArgs = {
          host = "vm";
          inherit self inputs username;
        };
      };
    };
  };

}


{
  description = "eza better ls";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
  let
    system = "aarch64-darwin"; # or "x86_64-darwin" if you have Intel Mac
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        exa
      ];
    };
  };
}

# Copyright 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{ self, ... }:
{
  flake.checks =
    let
      pkgsPerSystem = system: self.inputs.nixpkgs.legacyPackages.${system};
    in
    {
      x86_64-linux =
        let
          pkgs = pkgsPerSystem "x86_64-linux";
        in
        {
          installer = pkgs.callPackage ./installer { inherit self; };
        };
    };
}

{ config, pkgs, ... }:

{
	nixpkgs.overlays = [
		(self: super: {
			prism-overlayed = with pkgs; prismlauncher.override { jdks = [ zulu zulu17 zulu8 ]; };
		})
		(self: super: {
			lutris-overlayed = with pkgs; lutris.override {
				extraPkgs = pkgs: [
					wineWowPackages.stagingFull
				];
			};
		})
	];
}
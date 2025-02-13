{ config, pkgs, ... }:

{
	nixpkgs.overlays = [
		(self: super: {
			vivaldi-overlayed = with pkgs; vivaldi.override {
 				commandLineArgs = [
    			"--use-gl=angle" 
    			"--use-angle=vulkan" 
    			# "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE" 
    			# "--ignore-gpu-blocklist" 
    			# "--disable-gpu-driver-bug-workaround"
  			];
  			enableWidevine = true;
			};
  	})
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
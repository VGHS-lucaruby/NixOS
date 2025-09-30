{ config, ... }:

{
  boot.kernelParams = ["quiet"];
  boot.plymouth.enable = true;
  boot.plymouth.theme="breeze";
}
{ ... }:

{
  programs.ssh = {
    extraConfig = ''
    Host *
      SetEnv TERM=xterm-256color
    '';
  };
}
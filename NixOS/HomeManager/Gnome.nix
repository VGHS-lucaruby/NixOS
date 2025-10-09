{ config, lib, osConfig, pkgs, ... }:

{
  config = lib.mkIf (osConfig.modDesktop.name == "Gnome") {
    home.packages = with pkgs.gnomeExtensions; [
      dash-to-dock
      xwayland-indicator
      net-speed
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            dash-to-dock.extensionUuid
            xwayland-indicator.extensionUuid
            net-speed.extensionUuid
          ];
        };

        "org/gnome/desktop.peripherals/mouse".accel-profile = "flat";
        "org/gnome/mutter" = {experimental-features = ["scale-monitor-framebuffer"];};

        # Keybinds    
        "org/gnome/desktop/wm/keybindings" = {
          close = ["<Super>q"];
          toggle-fullscreen = ["<Super>f"];
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
          switch-to-workspace-5 = ["<Super>5"];
          switch-to-workspace-6 = ["<Super>6"];
          switch-to-workspace-7 = ["<Super>7"];
          switch-to-workspace-8 = ["<Super>8"];
          switch-to-workspace-9 = ["<Super>9"];
          move-to-workspace-1 = ["<Super><Shift>1"];
          move-to-workspace-2 = ["<Super><Shift>2"];
          move-to-workspace-3 = ["<Super><Shift>3"];
          move-to-workspace-4 = ["<Super><Shift>4"];
          move-to-workspace-5 = ["<Super><Shift>5"];
          move-to-workspace-6 = ["<Super><Shift>6"];
          move-to-workspace-7 = ["<Super><Shift>7"];
          move-to-workspace-8 = ["<Super><Shift>8"];
          move-to-workspace-9 = ["<Super><Shift>9"];
          # Disabled
          activate-window-menu = ["Disabled"];
          toggle-message-tray = ["Disabled"];
          move-to-monitor-down = ["Disabled"];
          move-to-monitor-left = ["Disabled"];
          move-to-monitor-right = ["Disabled"];
          move-to-monitor-up = ["Disabled"];
          move-to-workspace-down = ["Disabled"];
          move-to-workspace-up = ["Disabled"];
          unmaximize = ["Disabled"];
        };
        "org/gnome/shell/keybindings" = {
          show-screenshot-ui = ["<Super><Shift>s"];
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>Return";
          command = "kitty";
          name = "Open Kitty";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          binding = "<Super>b";
          command = "firefox";
          name = "Open Firefox";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
          binding = "<Super>e";
          command = "nautilus";
          name = "Open Nautilus";
        };
        "org/gnome/desktop/background" = {
          color-shading-type = "solid";
          picture-uri = "file://${config.modDesktopUser.background}";
          picture-uri-dark = "file://${config.modDesktopUser.background}";
        };
      };
    };
  };
}
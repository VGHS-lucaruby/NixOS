{ config, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ALL = "en_GB.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "uk";
}
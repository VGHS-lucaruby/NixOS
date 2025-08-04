{ lib, stdenv, fetchFromGitHub, kernel, kmod, linuxConsoleTools }:

let
  moduledir = "lib/modules/${kernel.modDirVersion}/kernel/drivers/hid";
  name = "hid-fanatecff";
  version = "0.2.1";
in 
stdenv.mkDerivation rec {
  pname = name;
  version = version;
  name = "${name}-${version}-${kernel.modDirVersion}";

  src = fetchFromGitHub {
    owner = "gotzl";
    repo = name;
    rev = version;
    sha256 = "1bgs19c10wbkld4cjfcpkn8cd7m3n13288jyq6n1h7dikkrfcs1k";
  };

    hardeningDisable = [ "pic" "format" ];
    nativeBuildInputs = kernel.moduleBuildDependencies;

    patchPhase = ''
        mkdir -p $out/lib/udev/rules.d
        mkdir -p $out/${moduledir}
        substituteInPlace Makefile --replace "/etc/udev/rules.d" "$out/lib/udev/rules.d"
        substituteInPlace fanatec.rules --replace "/usr/bin/evdev-joystick" "${linuxConsoleTools}/bin/evdev-joystick" --replace "/bin/sh" "${stdenv.shell}"
        sed -i '/depmod/d' Makefile
    '';

    makeFlags = [
        "KVERSION=${kernel.modDirVersion}"
        "KERNEL_SRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
        "MODULEDIR=$(out)/${moduledir}"
    ];
}
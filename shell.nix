{ pkgs ? import (fetchTarball https://nixos.org/channels/nixos-22.05/nixexprs.tar.xz) { } }:

# Use to setup development shell for NixOS.

with pkgs;
mkShell {
  buildInputs = with pkgs; [
    yarn
    gjs
    gtk4
    libadwaita
    gobject-introspection
    gnome.mutter
    atk
    gtk3
    polkit
    gcr
    networkmanager
    graphene
    gnome.gnome-shell
    zip
  ];

  shellHook = ''
    export GIR_EXT_PATH=${
      builtins.concatStringsSep ":" [
        "${pkgs.gnome.gnome-shell}/share/gnome-shell"
        "${pkgs.gnome.mutter}/lib/mutter-11"
        "${pkgs.gnome.mutter}/lib/mutter-10"
        "${pkgs.gnome.mutter}/lib/mutter-9"
        "${pkgs.gnome.mutter}/lib/mutter-8"
      ]
    }
  '';
}

{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = with pkgs; [
    python311
    uv
    pkgs.gcc14.cc.lib
    libGL
    glib
  ];

  shellHook = with pkgs; ''
  export LD_LIBRARY_PATH=${gcc14.cc.lib}/lib:${libGL}/lib:${glib.out}/lib:$LD_LIBRARY_PATH
  '';
}

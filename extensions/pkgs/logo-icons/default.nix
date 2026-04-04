{ stdenvNoCC, lib }:

let
  iconNames = [ "gmail" "gchat" "gcal" "gmeet" "notion" ];
in stdenvNoCC.mkDerivation {
  pname = "gregos-logo-icons";
  version = "1.0.0";

  src = ./assets;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/gregos/logos
    cp -r $src/*.svg $out/share/icons/gregos/logos/
    runHook postInstall
  '';

  passthru = lib.genAttrs iconNames (name:
    "${placeholder "out"}/share/icons/gregos/logos/${name}.svg"
  );

  meta = {
    description = "Logos and application icons";
    license = lib.licenses.unfree;
  };
}

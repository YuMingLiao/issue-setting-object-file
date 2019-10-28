{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, aeson, base, bytestring, classy-prelude
      , classy-prelude-yesod, file-embed, shakespeare, stdenv
      , template-haskell, text, wai, wai-extra, wai-logger, warp
      , warp-tls, yaml, yesod, yesod-core, yesod-static
      }:
      mkDerivation {
        pname = "formosa-charity";
        version = "0.0.0";
        src = ./.;
        isLibrary = true;
        isExecutable = true;
        enableSeparateDataOutput = true;
        libraryHaskellDepends = [
          aeson base bytestring classy-prelude classy-prelude-yesod
          file-embed template-haskell text wai wai-extra wai-logger warp
          warp-tls yaml yesod yesod-core yesod-static
        ];
        executableHaskellDepends = [
          aeson base bytestring classy-prelude classy-prelude-yesod
          file-embed shakespeare template-haskell text wai wai-extra
          wai-logger warp yaml yesod yesod-core yesod-static
        ];
        license = stdenv.lib.licenses.unfree;
        hydraPlatforms = stdenv.lib.platforms.none;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv

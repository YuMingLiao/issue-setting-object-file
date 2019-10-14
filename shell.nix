{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, aeson, base, basic-sop, binary, blaze-builder
      , blaze-html, blaze-markup, bytestring, case-insensitive
      , classy-prelude, classy-prelude-conduit, classy-prelude-yesod
      , conduit, containers, data-default, deepseq, directory
      , fast-logger, fb, file-embed, foreign-store, generics-sop, hjsmin
      , http-client-tls, http-conduit, lucid, lucid-extras, monad-control
      , monad-logger, mtl, project-m36, project-m36-typed, QuickCheck
      , rio, safe, shakespeare, stdenv, template-haskell, text, time
      , unordered-containers, vector, wai, wai-extra, wai-logger, warp
      , warp-tls, yaml, yesod, yesod-auth, yesod-auth-fb
      , yesod-auth-oauth2, yesod-core, yesod-crud, yesod-fb, yesod-form
      , yesod-lucid, yesod-project-m36, yesod-static
      }:
      mkDerivation {
        pname = "formosa-charity";
        version = "0.0.0";
        src = ./.;
        isLibrary = true;
        isExecutable = true;
        libraryHaskellDepends = [
          aeson base basic-sop binary blaze-builder blaze-html blaze-markup
          bytestring case-insensitive classy-prelude classy-prelude-conduit
          classy-prelude-yesod conduit containers data-default deepseq
          directory fast-logger fb file-embed foreign-store generics-sop
          hjsmin http-client-tls http-conduit lucid lucid-extras
          monad-control monad-logger mtl project-m36 project-m36-typed
          QuickCheck rio safe shakespeare template-haskell text time
          unordered-containers vector wai wai-extra wai-logger warp warp-tls
          yaml yesod yesod-auth yesod-auth-fb yesod-auth-oauth2 yesod-core
          yesod-crud yesod-fb yesod-form yesod-lucid yesod-project-m36
          yesod-static 
        ];
        executableHaskellDepends = [
          aeson base bytestring case-insensitive classy-prelude
          classy-prelude-conduit classy-prelude-yesod conduit containers
          data-default directory fast-logger file-embed foreign-store hjsmin
          http-client-tls http-conduit monad-control monad-logger safe
          shakespeare template-haskell text time unordered-containers vector
          wai wai-extra wai-logger warp yaml yesod yesod-auth yesod-core
          yesod-form yesod-static
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

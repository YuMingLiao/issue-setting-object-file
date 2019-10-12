let
  lib =
    { src = ./src;
      dependencies = [ "aeson" "base" "bytestring" "case-insensitive" "classy-prelude" "classy-prelude-conduit" "classy-prelude-yesod" "conduit" "containers" "data-default" "directory" "fast-logger" "file-embed" "foreign-store" "hjsmin" "http-client-tls" "http-conduit" "monad-control" "monad-logger" "safe" "shakespeare" "template-haskell" "text" "time" "unordered-containers" "vector" "wai" "wai-extra" "wai-logger" "warp" "warp-tls" "yaml" "yesod" "yesod-core" "yesod-form" "yesod-static" "project-m36" "yesod-auth" "rio" "project-m36-typed" "basic-sop" "th-utilities" "file-embed"]; 
      extensions = [ "OverloadedStrings"];
#      extra-directories =
#       (modName: [./config]) ;
    };
in
  { main = "main";
    src = ./app;
    packages = [ lib ];
    dependencies = [ "aeson" "base" "bytestring" "case-insensitive" "classy-prelude" "classy-prelude-conduit" "classy-prelude-yesod" "conduit" "containers" "data-default" "directory" "fast-logger" "file-embed" "foreign-store" "hjsmin" "http-client-tls" "http-conduit" "monad-control" "monad-logger" "safe" "shakespeare" "template-haskell" "text" "time" "unordered-containers" "vector" "wai" "wai-extra" "wai-logger" "warp" "warp-tls" "yaml" "yesod" "yesod-core" "yesod-form" "yesod-static" "project-m36" "yesod-auth" "rio" "project-m36-typed" "basic-sop" ]; 
    extra-directories =
       (modName: [./config]) ;
  }

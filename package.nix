let
  lib =
    { src = ./src;
      dependencies = [ "base" "file-embed" "text" "yaml" "yesod" "yesod-core" "yesod-form" "yesod-static" "classy-prelude" "classy-prelude-yesod"]; 
      extensions = [ "OverloadedStrings" "TemplateHaskell"];
#      extra-directories =
#       (modName: [./config]) ;
    };
in
  { main = "main";
    src = ./app;
    packages = [ lib ];
    dependencies = [ "base" "file-embed" "text" "yaml" "yesod" "yesod-core" "yesod-form" "yesod-static" "classy-prelude" "classy-prelude-yesod"]; 
    extensions = [ "OverloadedStrings" "TemplateHaskell"];
    extra-directories =
       (modName: [./.]) ;
  }

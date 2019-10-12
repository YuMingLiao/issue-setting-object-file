{ main = "Main";
  src = ./src;
  dependencies = ["file-embed"];
  extra-directories =
    (modName: [ ./assets ./config]);
}

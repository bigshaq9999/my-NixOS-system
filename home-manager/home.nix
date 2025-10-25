_: {
  programs = {
    git.enable = true;
    gh.enable = true;
  };

  home.sessionVariables = {
    "GTK_CSD" = "0";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

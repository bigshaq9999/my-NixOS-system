_: {
  programs = {
    git.enable = true;
    gh.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

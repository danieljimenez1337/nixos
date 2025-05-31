{pkgs, ...}: {
  home.packages = [
    pkgs.alacritty
    pkgs.alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      window.padding.x = 30;
      window.padding.y = 30;
      font.normal.family = "JetBrainsMonoNL Nerd Font";
      font.normal.style = "Regular";
      font.size = 20;
      window.opacity = 0.7;
      general.import = ["${pkgs.alacritty-theme}/gruvbox_dark.toml"];
    };
  };
}

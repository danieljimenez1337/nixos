{ pkgs, ... }:
{
  home.packages = [
    # Cli Tools
    pkgs.git
    pkgs.ripgrep
    pkgs.fd
    pkgs.zellij
    pkgs.gh
    pkgs.btop
    pkgs.yazi
    pkgs.fzf
    pkgs.fastfetch
    pkgs.just
    pkgs.oxker
    pkgs.tokei
    pkgs.rip2
    pkgs.zoxide
  ];

  programs.lazygit = {
    enable = true;

    settings = {
      quitOnTopLevelReturn = true;
    };
  };

  home.shellAliases = {
    nupdate = "sudo nix flake update";
    nclean = "nix-env --delete-generations 7d";
    ngarbage = "sudo nix-collect-garbage -d";
    lg = "lazygit";
    gs = "git status";
    gl = "git prettylog";
    zed = "zeditor";
  };
}

{ pkgs, ... }:
{
  home.packages = [
    # Cli Tools
    pkgs.btop
    pkgs.fastfetch
    pkgs.fd
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.jq
    pkgs.just
    pkgs.oxker
    pkgs.rip2
    pkgs.ripgrep
    pkgs.tokei
    pkgs.yazi
    pkgs.zellij
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

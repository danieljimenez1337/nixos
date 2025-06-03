{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun,filebrowser,window,run";
      show-icons = false;
      display-drun = "";
      display-run = "";
      display-filebrowser = "";
      display-window = "";
      drun-display-format = "{name}";
      window-format = "{w}{t}";
      font = "JetBrainsMono Nerd Font 12";
      icon-theme = "Tela-circle";
    };

    # inspired by https://github.com/HyDE-Project/HyDE/blob/master/Configs/.local/share/hyde/rofi/themes/style_11.rasi
    theme = mkForce {
      "*" = {
        main-bg = mkLiteral "#282828CC";
        main-fg = mkLiteral "#CBCED3FF";
        main-br = mkLiteral "#EBDBB2FF";
        main-ex = mkLiteral "#85A583FF";
        select-bg = mkLiteral "#427B58FF";
        select-fg = mkLiteral "#B5CC97FF";
        separatorcolor = mkLiteral "transparent";
        border-color = mkLiteral "transparent";
      };

      window = {
        height = mkLiteral "30em";
        width = mkLiteral "58em";
        transparency = "real";
        fullscreen = false;
        enabled = true;
        cursor = "default";
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        border = mkLiteral "0px";
        border-radius = mkLiteral "1em 1em 1em 1em";
        background-color = mkLiteral "@main-bg";
      };

      mainbox = {
        enabled = true;
        spacing = mkLiteral "0em";
        padding = mkLiteral "0.8em";
        orientation = mkLiteral "horizontal";
        children = map mkLiteral ["inputbar" "listbox"];
        background-color = mkLiteral "#00000003";
      };

      inputbar = {
        enabled = true;
        width = mkLiteral "28.5em";
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        children = map mkLiteral ["entry"];
        expand = false;
        background-color = mkLiteral "@main-bg";
        background-image = mkLiteral "url(\"/home/danielj/nixos/modules/hyprland/background.png\", height)";
        border-radius = mkLiteral "1em";
      };

      entry = {
        enabled = false;
      };

      listbox = {
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        children = map mkLiteral ["dummy" "listview" "dummy"];
        background-color = mkLiteral "transparent";
        border-radius = mkLiteral "0em 1em 1em 0em";
      };

      listview = {
        enabled = true;
        spacing = mkLiteral "0em";
        padding = mkLiteral "1em 2em 1em 2em";
        columns = 1;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        expand = false;
        fixed-height = true;
        fixed-columns = true;
        cursor = "default";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@main-fg";
      };

      dummy = {
        background-color = mkLiteral "transparent";
      };

      element = {
        enabled = true;
        spacing = mkLiteral "1em";
        padding = mkLiteral "0.5em 0.5em 0.5em 1.5em";
        cursor = "pointer";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@main-fg";
        border-radius = mkLiteral "1em 1em 1em 1em";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@select-bg";
        text-color = mkLiteral "@select-fg";
      };

      element-text = {
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        cursor = mkLiteral "inherit";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        font = "JetBrainsMono Nerd Font 20";
      };

      error-message = {
        text-color = mkLiteral "@main-fg";
        background-color = mkLiteral "@main-bg";
        text-transform = mkLiteral "capitalize";
        children = map mkLiteral ["textbox"];
      };

      textbox = {
        text-color = mkLiteral "inherit";
        background-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };
    };
  };
}

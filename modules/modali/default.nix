{
  pkgs,
  inputs,
  ...
}: let
  modaliPackage = inputs.modali-launcher.packages.x86_64-linux.default;

  keybindings = [
    {
      key = "g";
      description = "Go to Google";
      command = "xdg-open https://google.com";
    }
    {
      key = "a";
      description = "Applications";
      sub_actions = [
        {
          key = "t";
          description = "Terminal";
          command = "alacritty";
        }
        {
          key = "f";
          description = "File Manager";
          command = "nautilus";
        }
        {
          key = "b";
          description = "Browser";
          command = "chromium";
        }
        {
          key = "e";
          description = "Editor";
          command = "zed";
        }
      ];
    }
    {
      key = "s";
      description = "System";
      sub_actions = [
        {
          key = "l";
          command = "loginctl lock-session";
          description = "Lock Screen";
        }
        {
          key = "r";
          command = "systemctl reboot";
          description = "Reboot";
        }
        {
          key = "p";
          command = "systemctl poweroff";
          description = "Power Off";
        }
        {
          key = "s";
          command = "systemctl suspend";
          description = "Suspend";
        }
      ];
    }
    {
      key = "d";
      description = "Development";
      sub_actions = [
        {
          key = "g";
          description = "Git Status";
          command = "alacritty -e fish -c 'git status; read'";
        }
        {
          key = "l";
          description = "LazyGit";
          command = "alacritty -e lazygit";
        }
        {
          key = "n";
          description = "Neovim";
          command = "alacritty -e nvim";
        }
      ];
    }
    {
      key = "w";
      description = "Workspaces";
      sub_actions = [
        {
          key = "1";
          description = "Workspace 1";
          command = "hyprctl dispatch workspace 1";
        }
        {
          key = "2";
          description = "Workspace 2";
          command = "hyprctl dispatch workspace 2";
        }
        {
          key = "3";
          description = "Workspace 3";
          command = "hyprctl dispatch workspace 3";
        }
        {
          key = "4";
          description = "Workspace 4";
          command = "hyprctl dispatch workspace 4";
        }
        {
          key = "5";
          description = "Workspace 5";
          command = "hyprctl dispatch workspace 5";
        }
      ];
    }
  ];

  bindingsJson = pkgs.writeText "modali-bindings.json" (builtins.toJSON keybindings);
in {
  home.packages = [ modaliPackage ];

  xdg.configFile."modali/bindings.json".source = bindingsJson;
}

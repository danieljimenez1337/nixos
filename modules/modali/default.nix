{
  pkgs,
  inputs,
  ...
}: {
  programs.modali = {
    enable = true;
    keybindings = [
      {
        type = "KeyAction";
        key = "r";
        description = "Rofi";
        command = "rofi -show drun";
      }
      {
        type = "KeyAction";
        key = "t";
        description = "Terminal";
        command = "alacritty";
      }
      {
        type = "KeyAction";
        key = "e";
        description = "Editor";
        command = "zeditor";
      }
      {
        type = "SubAction";
        key = "b";
        description = "FireFox";
        sub_actions = [
          {
            type = "KeyAction";
            key = "t";
            description = "Tab";
            command = "firefox --new-tab about:newtab";
          }
          {
            type = "KeyAction";
            key = "b";
            description = "Open";
            command = "firefox";
          }
        ];
      }
      {
        type = "SubAction";
        key = "s";
        description = "System";
        sub_actions = [
          {
            type = "KeyAction";
            key = "l";
            command = "loginctl lock-session";
            description = "Lock Screen";
          }
          {
            type = "KeyAction";
            key = "r";
            command = "systemctl reboot";
            description = "Reboot";
          }
          {
            type = "KeyAction";
            key = "p";
            command = "systemctl poweroff";
            description = "Power Off";
          }
          {
            type = "KeyAction";
            key = "s";
            command = "systemctl suspend";
            description = "Suspend";
          }
        ];
      }
      {
        type = "SubAction";
        key = "w";
        description = "Workspaces";
        sub_actions = [
          {
            type = "KeyAction";
            key = "1";
            description = "Workspace 1";
            command = "hyprctl dispatch workspace 1";
          }
          {
            type = "KeyAction";
            key = "2";
            description = "Workspace 2";
            command = "hyprctl dispatch workspace 2";
          }
          {
            type = "KeyAction";
            key = "3";
            description = "Workspace 3";
            command = "hyprctl dispatch workspace 3";
          }
          {
            type = "KeyAction";
            key = "4";
            description = "Workspace 4";
            command = "hyprctl dispatch workspace 4";
          }
          {
            type = "KeyAction";
            key = "5";
            description = "Workspace 5";
            command = "hyprctl dispatch workspace 5";
          }
        ];
      }
    ];
  };
}

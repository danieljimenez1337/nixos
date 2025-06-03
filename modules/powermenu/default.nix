{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rofi-wayland
    (pkgs.writeScriptBin "powermenu" ''
      #!/usr/bin/env bash
      options="⏻ Shutdown\n⟲ Reboot\n🔒 Lock\n⏏ Logout"
      chosen=$(echo -e "$options" | ${pkgs.rofi-wayland}/bin/rofi -dmenu -i -p "Power Menu")
      case $chosen in
          "⏻ Shutdown")
              ${pkgs.systemd}/bin/systemctl poweroff
              ;;
          "⟲ Reboot")
              ${pkgs.systemd}/bin/systemctl reboot
              ;;
          "🔒 Lock")
              ${pkgs.systemd}/bin/loginctl lock-session
              ;;
          "⏏ Logout")
              ${pkgs.hyprland}/bin/hyprctl dispatch exit
              ;;
      esac
    '')
    (pkgs.makeDesktopItem {
      name = "powermenu";
      desktopName = "Power Menu";
      comment = "Power management menu";
      exec = "powermenu";
      icon = "system-shutdown";
      categories = [ "System" "Settings" ];
      terminal = false;
    })
  ];
}
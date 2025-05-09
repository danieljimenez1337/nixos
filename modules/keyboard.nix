{pkgs, ...}: {
  # Add vial package to system packages
  environment.systemPackages = with pkgs; [
    vial
  ];

  # Add udev rules for Ergohaven Velvet v3
  services.udev.extraRules = ''
    # Ergohaven Velvet v3
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="e126", ATTRS{idProduct}=="0061", MODE="0660", GROUP="users", TAG+="uaccess"
  '';
}
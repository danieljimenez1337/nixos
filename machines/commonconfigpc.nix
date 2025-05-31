{
  # config,
  # lib,
  pkgs,
  # inputs,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable the Gnome Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable  = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # environment.systemPackages = with pkgs; [
  #   # Embedded
  #   (segger-jlink.override {acceptLicense = true;})
  # ];

  services.flatpak.enable = true;

  # services.udev.packages = [
  #   (pkgs.segger-jlink.override {acceptLicense = true;})
  # ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   "segger-jlink-qt4-796s"
  # ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    # pkgs.nerd-fonts.zed-mono
  ];
}

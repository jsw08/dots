{ config, pkgs, ... }:
{
  environment.variables = {
    XDG_CURRENT_DESKTOP="Hyprland";
    XDG_SESSION_TYPE="wayland";
    XDG_SESSION_DESKTOP="Hyprland";
    QT_AUTO_SCREEN_SCALE_FACTOR="1";
    QT_QPA_PLATFORM="wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
    SDL_VIDEODRIVER="x11";
    _JAVA_AWT_WM_NONEREPARENTING="1";
    CLUTTER_BACKEND="wayland";
    GDK_BACKEND="wayland";
    NIXOS_OZONE_WL = "1";
    HYPRLAND_LOG_WLR = "1";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
    MOZ_ENABLE_WAYLAND = "1";
    XMODIFIERS = "@im=fcitx";
  };
}

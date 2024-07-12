{ pkgs, userConfig, ... }:
let
  cfg = {
    mod = "Mod4";
    term = userConfig.terminal;
    browser = userConfig.browser;
    menu = "wofi --show drun --allow-images -a";
    files = "nemo";

    up = "k";
    down = "j";
    right = "l";
    left = "h";
  };
in
{
  programs.zsh.initExtra = ''
    if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
      dbus-run-session sway
    fi
  '';

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    systemd.enable = false;
    checkConfig = false;

    config = {
      modifier = cfg.mod;
      terminal = cfg.term;
      menu = cfg.menu;
      bars = [ ];
      defaultWorkspace = "workspace number 1";

      #---Output---#
      output."*" = {
        mode = "2560x1440@144Hz position 0 0";
        bg = "/home/${userConfig.username}/wallpaper/default.png fill";
      };

      #---Startup---#
      startup = [
        { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
	{ command = "${pkgs.corectrl}/bin/corectrl"; }
        { command = "${pkgs.waybar}/bin/waybar"; }
        { command = "${pkgs.autotiling}/bin/autotiling --limit 2"; }
        { command = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.clipman}/bin/clipman store"; }
        { command = "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"; }
	{ command = "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"; }
      ];

      #---Input---#
      input = {
        "*" = {
          accel_profile = "flat";
          pointer_accel = "0";
          xkb_layout = "us,us";
          xkb_variant = "alt-intl,";
          xkb_options = "grp:rctrl_toggle";
          repeat_delay = "300";
          repeat_rate = "30";
        };
        "1356:1476:Sony_Computer_Entertainment_Wireless_Controller_Touchpad" = {
          events = "disabled";
        };
      };

      gaps = {
        inner = 5;
        outer = 10;
      };

      window = {
        border = 0;
        titlebar = false;
      };

      floating = {
        border = 0;
        titlebar = false;
        criteria = [
          { app_id = "Thunar"; title = "File Operation Progress"; }
          { app_id = "org.pulseaudio.pavucontrol"; }
          { app_id = ".blueman-manager-wrapped"; }
          #---Steam---#
          { class = "steam"; title = "Friends List"; }
          { class = "steam"; title = "Steam - News"; }
          { class = "steam"; title = "^.* - Chat$"; }
          { class = "steam"; title = "^.* - event started$"; }
          { class = "steam"; title = "^.* CD key$"; }
          { class = "steam"; title = "Steam Settings"; }
          { class = "steam"; title = "Steam - Self Updater"; }
          { class = "steam"; title = "Screenshot Uploader"; }
          { class = "steam"; title = "Steam Guard - Computer Authorization Required"; }
          { title = "Steam Keyboard"; }
          #---Firefox---#
          { title = "About Mozilla Firefox"; }
          { window_role = "About"; }
          { app_id = "firefox"; title = "Library"; }
          #---Gentoo wiki---#
          { window_role = "popup"; }
          { window_role = "bubble"; }
          { window_role = "dialog"; }
          { window_type = "dialog"; }
          { window_role = "task_dialog"; }
          { window_type = "menu"; }
          { app_id = "floating"; }
          { app_id = "floating_update"; }
          { class = "(?i)pinentry"; }
          { title = "Administrator privileges required"; }
        ];
      };

      keybindings = {
        #---Sway---#
        "${cfg.mod}+m" = "exec swaymsg exit";
        "${cfg.mod}+Shift+c" = "reload";

        #---Programs---#
        "${cfg.mod}+t" = "exec ${cfg.term}";
        "${cfg.mod}+b" = "exec ${cfg.browser}";
        "${cfg.mod}+e" = "exec ${cfg.files}";
        "${cfg.mod}+space" = "exec ${cfg.menu}";
        "${cfg.mod}+q" = "kill";

        #---Layouts---#
        "${cfg.mod}+f" = "fullscreen";
        "${cfg.mod}+v" = "floating toggle";
        "${cfg.mod}+r" = "mode \"resize\"";

        #---Focus---#
        "${cfg.mod}+${cfg.up}" = "focus up";
        "${cfg.mod}+${cfg.down}" = "focus down";
        "${cfg.mod}+${cfg.right}" = "focus right";
        "${cfg.mod}+${cfg.left}" = "focus left";
        "${cfg.mod}+Up" = "focus up";
        "${cfg.mod}+Down" = "focus down";
        "${cfg.mod}+Right" = "focues right";
        "${cfg.mod}+Left" = "focus left";

        #---Move---#
        "${cfg.mod}+Shift+${cfg.up}" = "move up";
        "${cfg.mod}+Shift+${cfg.down}" = "move down";
        "${cfg.mod}+Shift+${cfg.right}" = "move right";
        "${cfg.mod}+Shift+${cfg.left}" = "move left";
        "${cfg.mod}+Shift+Up" = "move up";
        "${cfg.mod}+Shift+Down" = "move down";
        "${cfg.mod}+Shift+Right" = "move right";
        "${cfg.mod}+Shift+Left" = "move left";

        #---Workspace Navigation---#
        "${cfg.mod}+1" = "workspace number 1";
        "${cfg.mod}+2" = "workspace number 2";
        "${cfg.mod}+3" = "workspace number 3";
        "${cfg.mod}+4" = "workspace number 4";
        "${cfg.mod}+5" = "workspace number 5";
        "${cfg.mod}+6" = "workspace number 6";
        "${cfg.mod}+7" = "workspace number 7";
        "${cfg.mod}+8" = "workspace number 8";
        "${cfg.mod}+9" = "workspace number 9";
        "${cfg.mod}+0" = "workspace number 10";
        "${cfg.mod}+Shift+1" = "move container to workspace number 1";
        "${cfg.mod}+Shift+2" = "move container to workspace number 2";
        "${cfg.mod}+Shift+3" = "move container to workspace number 3";
        "${cfg.mod}+Shift+4" = "move container to workspace number 4";
        "${cfg.mod}+Shift+5" = "move container to workspace number 5";
        "${cfg.mod}+Shift+6" = "move container to workspace number 6";
        "${cfg.mod}+Shift+7" = "move container to workspace number 7";
        "${cfg.mod}+Shift+8" = "move container to workspace number 8";
        "${cfg.mod}+Shift+9" = "move container to workspace number 9";
        "${cfg.mod}+Shift+0" = "move container to workspace number 10";

        #---Media Keys---#
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
      };

      modes."resize" = {
        "${cfg.up}" = "resize grow height 10px";
        "${cfg.down}" = "resize shrink height 10px";
        "${cfg.right}" = "resize grow width 10px";
        "${cfg.left}" = "resize shrink width 10px";
        "Up" = "resize grow height 10px";
        "Down" = "resize shrink height 10px";
        "Right" = "resize grow width 10px";
        "Left" = "resize shrink width 10px";
        "Return" = "mode \"default\"";
        "Escape" = "mode \"default\"";
      };
    };
  };
}

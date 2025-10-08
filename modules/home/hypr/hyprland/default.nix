{ pkgs, host, ... }:
{

  home.packages = [
    pkgs.swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {

      env = [
        "HYPRCURSOR_SIZE,9"
        "XCURSOR_SIZE, 9"

        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "HYPRLAND_PRIMARY_MONITOR,DP-1"
        "WLR_BACKEND,vulkan"
        "WLR_RENDERER,vulkan"
        "WLR_NO_HARDWARE_CURSORS,1"
        "XDG_RUNTIME_DIR,$"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots"
      ];

      monitor =
        if (host == "desktop") then
          [
            "DP-3,1920x1080@144,0x0,1"
            "DP-4,preferred,1920x0,1"
          ]
        else
          [
            ",preferred,auto,1"
          ];

      workspace =
        if (host == "desktop") then
          [
            "1,monitor:DP-3"
            "2,monitor:DP-3"
            "3,monitor:DP-3"
            "4,monitor:DP-3"
            "5,monitor:DP-3"
            "6,monitor:DP-4"
            "7,monitor:DP-4"
            "8,monitor:DP-4"
            "9,monitor:DP-4"
            "10,monitor:DP-4"
          ]
        else
          [

          ];

      "$mainMod" = "SUPER";
      "$terminal" = "foot";
      "$fileManager" = "nemo";
      "$notificationCenter" = "swaync-client -t -sw";
      "$menu" = "rofi -modi drun -show drun || pkill rofi";
      "$browser" = "zen";
      "$bookManager" = "bash -x ${./scripts/book_manager.sh}";

      exec-once = [
        "swww init"
        "swww img ${../../../../assets/wallpaper.png}"
        "hypridle"
        "swaync"
        "hyprctl setcursor Bibata-Modern-Ice 9 &"
        "sleep 1 && waybar &"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 0;

        border_size = 5;

        "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
        "col.inactive_border" = "rgba(3c3836ff)";

        resize_on_border = true;

        allow_tearing = false;
        layout = "master";
      };

      decoration = {

        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.06, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1.0"
          "quick, 0.15, 0, 0.1, 1"
        ];

        animation = [
          "global,        1, 10,    default"
          "border,        1, 5.39,  easeOutQuint"
          "windows,       1, 4.79,  easeOutQuint"
          "windowsIn,     1, 4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1, 1.49,  linear, popin 87%"
          "fadeIn,        1, 1.73,  almostLinear"
          "fadeOut,       1, 1.46,  almostLinear"
          "fade,          1, 3.03,  quick"
          "layers,        1, 3.81,  easeOutQuint"
          "layersIn,      1, 4,     easeOutQuint, fade"
          "layersOut,     1, 1.5,   linear, fade"
          "workspaces,    1, 1.94,  almostLinear, fade"
          "workspacesIn,  1, 1.21,  almostLinear, fade"
          "workspacesOut, 1, 1.94,  almostLinear, fade"
        ];
      };

      input = {
        kb_layout = "ca";
        kb_variant = "fr";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = 1;
        numlock_by_default = true;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          tap-to-click = false;
        };
      };

      cursor = {
        hide_on_key_press = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/
      master.new_status = "master";

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;

        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
      };

      xwayland.force_zero_scaling = true;

      windowrule = [
        "pin,class:^(rofi)$"

        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
      ];

      bind = [
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "$mainMod, S, exec, spotify"
        "$mainMod, O, exec, obitisian"
        "$mainMod, Z, exec, $browser"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, B, exec, $bookManager"
        "$mainMod, N, exec, $notificationCenter"
        "$mainMod CTRL, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, fullscreen"
        "$mainMod, Space, togglefloating,"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, R, exec, $menu"
        # screenshots
        "$mainMod SHIFT, S, exec, sh -c 'grim -g \"$(slurp)\" - | swappy -f -'"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"

        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}

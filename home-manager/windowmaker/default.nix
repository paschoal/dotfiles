{ pkgs, ... }:

{
  home.file."GNUstep/Defaults/WindowMaker" = {
    enable = true;
    text = ''
      {
        FrameBorderColor = "#000000";
        FTitleColor = "#ffffff";
        MenuDisabledColor = "#7f7f7f";
        IconTitleBack = "#000000";
        IconTitleColor = "#ffffff";
        MenuTitleColor = "#ffffff";
        HighlightTextColor = "#000000";
        ClipTitleColor = "#000000";
        FrameFocusedBorderColor = "#000000";
        FrameSelectedBorderColor = "#ffffff";
        MenuTextColor = "#000000";
        HighlightColor = "#ffffff";
        CClipTitleColor = "#616161";
        UTitleColor = "#000000";
        PTitleColor = "#ffffff";

        PixmapPath = (
          "/home/paschoal/GNUstep/Library/WindowMaker/Pixmaps",
          "/home/paschoal/GNUstep/Library/WindowMaker/Backgrounds",
          "/home/paschoal/GNUstep/Library/WindowMaker/CachedPixmaps",
          "${pkgs.windowmaker}/share/WindowMaker/Pixmaps",
          "${pkgs.windowmaker}/share/WindowMaker/Backgrounds",
          "${pkgs.windowmaker}/share/pixmaps"
        );

        IconPath = (
          "/home/paschoal/GNUstep/Library/Icons",
          "/home/paschoal/GNUstep/Library/WindowMaker/Pixmaps",
          "/home/paschoal/GNUstep/Library/WindowMaker/CachedPixmaps",
          "${pkgs.windowmaker}/share/WindowMaker/Icons",
          "${pkgs.windowmaker}/share/WindowMaker/Pixmaps",
          "${pkgs.windowmaker}/share/pixmaps"
        );

        HotCorners = NO;
        HotCornerActions = (None, None, None, None);
        HotCornerDelay = 250;
        HotCornerEdge = 2;

        IconPosition = blv;
        EnforceIconMargin = YES;
        AutoArrangeIcons = YES;
        WindowTitleBalloons = NO;
        ResizeIncrement = 10;
        DbClickFullScreen = NO;
        WindowSnapping = YES;
        CycleActiveHeadOnly = YES;
        CloseRootMenuByLeftOrRightMouseClick = NO;
        AntialiasedText = YES;
        NoWindowOverDock = YES;
        NoWindowOverIcons = YES;
        EnforceIconMargin = YES;
        KbdModeLock = NO;
        ShowClipTitle = NO;
        SaveSessionOnExit = YES;

        MoveTo12to6Head = None;
        MoveTo6to12Head = None;

        MenuTitleFont = "Iosevka Nerd Font Mono:slant=0:weight=200:width=100:pixelsize=14";
        WindowTitleFont = "Iosevka Nerd Font Mono:slant=0:weight=80:width=100:pixelsize=14";
        MenuTextFont = "Iosevka Nerd Font Mono:slant=0:weight=80:width=100:pixelsize=14";

        Workspace1Key = "Mod1+1";
        Workspace2Key = "Mod1+2";
        Workspace3Key = "Mod1+3";
        Workspace4Key = "Mod1+4";
        Workspace5Key = "Mod1+5";
        Workspace6Key = "Mod1+6";
        Workspace7Key = "Mod1+7";
        Workspace8Key = "Mod1+8";
        Workspace9Key = "Mod1+9";
        Workspace10Key = "Mod1+0";

        ScreenCaptureKey = Print;
        CenterKey = None;
        HideKey = None;
        RootMenuKey = None;
        MiniaturizeKey = None;
        FocusNextKey = "Mod1+L";
        FocusPrevKey = "Mod1+H";
        WindowListKey = "Mod1+Tab";
        ToggleKbdModeKey = None;
        WindowMenuKey = None;
        LowerKey = None;
        PrevWorkspaceKey = "Mod1+J";
        NextWorkspaceKey = "Mod1+K";
        RaiseKey = None;
      }
    '';
  };

  home.file."GNUstep/Defaults/WMRootMenu" = {
    enable = true;
    text = ''
      (
        "Window Maker",
        (
          Applications,
          (Qutebrowser, EXEC, qutebrowser)
        ),
        (Terminal, SHORTCUT, "Mod1+Return", EXEC, st),
        (Run..., EXEC, "%A(Run, Type command:)"),
        (Workspaces, WORKSPACE_MENU),
        (
          Workspace,
          ("Hide Others", HIDE_OTHERS),
          ("Show All", SHOW_ALL),
          ("Arrange Icons", ARRANGE_ICONS),
          (Refresh, REFRESH),
          ("Save Session", SAVE_SESSION),
          ("Clear Session", CLEAR_SESSION)
        ),
        (
          Setup,
          ("Configure Window Maker", EXEC, WPrefs),
          ("Restart Window Maker", RESTART),
          ("Info Panel", INFO_PANEL),
          (Session)
        ),
        (Quit, EXIT)
      )
    '';
  };
}

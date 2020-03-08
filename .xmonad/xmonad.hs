-- ~/.xmonad/xmonad.hs

-- Modules
import XMonad                         -- General
import XMonad.Config.Desktop          -- defaultConfig(xmonad-contrib.Desktop)
import XMonad.Hooks.ManageDocks       -- "Status-bar" avoid dock/panel/trayer
import XMonad.Hooks.DynamicLog        -- "Status-bar" logHook
import XMonad.Hooks.EwmhDesktops      -- Blowser Full Screen Mode(F11)

import XMonad.Layout.PerWorkspace     -- Select WorkSpace
import XMonad.Layout.Spacing          -- Window Spacing [spacingRaw:gapwidth]
import XMonad.Layout.Gaps             -- Window Spacing [gaps:gwU,gwD,gwL,gwR]
import XMonad.Layout.SimplestFloat    -- Display "1" Through Stack
import XMonad.Layout.Simplest         -- Display "1" Through Full
import XMonad.Layout.NoBorders        -- Display "1" NoBorders
import XMonad.Layout.ResizableTile    -- Display "2" Tile
import XMonad.Layout.TwoPane          -- Display "2" TwoPane
import XMonad.Layout.ThreeColumns     -- Display "3" MainWindow TreeColumns
import XMonad.Layout.Circle           -- Display "3" MainWindow Circle
import XMonad.Layout.Accordion        -- Display "4" Layer
import XMonad.Layout.Tabbed           -- Display "4" Tab Bar

import XMonad.Util.Run                -- spawnPipe,hPutStrLn "Status-bar" -> myStatusBar
import XMonad.Util.Themes             -- Tab Bar Theme

-- Window BorderWidth
borderwidth = 3

-- Colors
colorDarkGray = "#676767"
colorGray     = "#7b7b7b"
colorOrange   = "#ebac54"
colorBlack    = "#000000"
colorWhite    = "#ffffff"
colorRed      = "#9f0000"
colorGreen    = "#7e9476"

-- XMonad.Layout.Gaps
gwU      = 16   -- Up               -- Steed myLayoutHook = avoidStruts $
gwD      = 0    -- Down
gwR      = 0    -- Right
gwL      = 0    -- Left
gapwidth = 2    -- spacingRaw

-- XMonad.Util.Themes >> http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Util-Themes.html#t:ThemeInfo
-- listOfThemes|ppThemeInfo|xmonadTheme|smallClean|robertTheme|deiflTheme|oxymor00nTheme|donaldTheme|wfarrTheme|kavonForestTheme|
-- kavonLakeTheme|kavonPeacockTheme|kavonVioGreenTheme|kavonBluesTheme|kavonAutumnTheme|kavonFireTheme|kavonChristmasTheme|
tabbedTheme = kavonChristmasTheme

-- Local Variables
-- General
myModMask            = mod4Mask      -- Win key or Super_L
myBorderWidth        = borderwidth
myNormalBorderColor  = colorDarkGray
myFocusedBorderColor = colorGreen
-- Display
myWorkSpaces      = ["1","2","3","4","5"]
myHandleEventHook = ewmhDesktopsEventHook
myManageHook      = manageDocks
myLayoutHook      = onWorkspace "1" (gaps [(U, gwU),(D, gwD),(R, gwR),(L, gwL)]
                    (noBorders $ simplestFloat ||| Simplest ) ||| noBorders Simplest)
                  $ gaps [(U, gwU),(D, gwD),(R, gwR),(L, gwL)]
                  $ spacingRaw True (Border 0 0 0 0) True (Border gapwidth gapwidth gapwidth gapwidth) True
                  $ onWorkspace "2" (ResizableTall 1 (3/100) (1/2) [] ||| TwoPane (3/100) (1/2) ||| Simplest)
                  $ onWorkspace "3" (ThreeColMid 1 (3/100) (1/2) ||| Circle)
                  $ onWorkspace "4" (Accordion ||| tabbed shrinkText (theme tabbedTheme))
                  (simplestFloat ||| Full)
-- "Status-bar" LogHook
myLogHook h = dynamicLogWithPP $ def
              {
               ppCurrent           = dzenColor colorOrange colorBlack . pad
             , ppVisible           = dzenColor colorWhite  colorBlack . pad
             , ppHidden            = dzenColor colorWhite  colorBlack . pad
             , ppHiddenNoWindows   = dzenColor colorGray   colorBlack . pad
             , ppUrgent            = dzenColor colorRed    colorBlack . pad
             , ppWsSep             = " "
             , ppSep               = " * "
             , ppTitle             = (" " ++) . dzenColor colorGreen colorBlack . dzenEscape
             , ppOutput            = hPutStrLn h
              }
myXmonadBar = "dzen2 -x 0 -y 0 -w 400 -ta left -fn xft:TakaoPGothic:size=10:bold:antialias=true -title-name XMONAD_BAR -p"

-- Main
main = do
  -- "Status-bar" LogHook
  dzenLeftBar <- spawnPipe myXmonadBar

  xmonad $ ewmh desktopConfig
    { 
    -- General
      modMask            = myModMask
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor

    -- Display
    , workspaces         = myWorkSpaces
    , handleEventHook    = myHandleEventHook
    , manageHook         = myManageHook
    , layoutHook         = myLayoutHook

    -- Status-bar logHook
    , logHook            = myLogHook $ dzenLeftBar
    }

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
import XMonad.Layout.NoBorders        -- Display "1" NoBorders
import XMonad.Layout.ResizableTile    -- Display "2" Tile
import XMonad.Layout.TwoPane          -- Display "2" TwoPane
import XMonad.Layout.ThreeColumns     -- Display "3" MainWindow TreeColumns
import XMonad.Layout.Circle           -- Display "3" MainWindow Circle
import XMonad.Layout.Simplest         -- Display Through Full
import XMonad.Layout.Accordion        -- Display Layer
import XMonad.Layout.Tabbed           -- Display Tab Bar

import XMonad.Util.Run                -- spawnPipe,hPutStrLn "Status-bar" -> myStatusBar
import XMonad.Util.Themes             -- Tab Bar Theme 

-- Window BorderWidth
borderwidth = 3

-- Colors
colorGray   = "#676767"
colorRed    = "#9f0000"

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
myModMask            = mod4Mask     -- Win key or Super_L
myBorderWidth        = borderwidth
myNormalBorderColor  = colorGray
myFocusedBorderColor = colorRed
-- Display
myWorkSpaces      = ["1","2","3","4"]
myHandleEventHook = ewmhDesktopsEventHook <+> fullscreenEventHook
myManageHook      = manageDocks
myLayoutHook      = onWorkspace "1" (gaps [(U, gwU),(D, gwD),(R, gwR),(L, gwL)]
                    (noBorders $ simplestFloat ||| Simplest ) ||| noBorders Simplest)
                  $ gaps [(U, gwU),(D, gwD),(R, gwR),(L, gwL)]
                  $ spacingRaw True (Border 0 0 0 0) True (Border gapwidth gapwidth gapwidth gapwidth) True
                  $ onWorkspace "2" (ResizableTall 1 (3/100) (1/2) [] ||| TwoPane (3/100) (1/2) ||| Simplest)
                  $ onWorkspace "3" (ThreeColMid 1 (3/100) (1/2) ||| Circle)
                  (Accordion ||| tabbed shrinkText (theme tabbedTheme))
-- "Status-bar" LogHook
myLogHook h = dynamicLogWithPP sjanssenPP
              {
               ppCurrent           =   dzenColor "#ebac54" "#1B1D1E" . pad
             , ppVisible           =   dzenColor "white"   "#1B1D1E" . pad
             , ppHidden            =   dzenColor "white"   "#1B1D1E" . pad
             , ppHiddenNoWindows   =   dzenColor "#7b7b7b" "#1B1D1E" . pad
             , ppUrgent            =   dzenColor "#ff0000" "#1B1D1E" . pad
             , ppWsSep             =   " "
             , ppSep               =   " : "
             , ppTitle             =   (" " ++) . dzenColor "green" "#1B1D1E" . dzenEscape
             , ppOutput = hPutStrLn h
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
    , logHook            = myLogHook dzenLeftBar
    }

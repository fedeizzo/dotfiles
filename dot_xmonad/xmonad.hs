import System.Exit
import System.IO
import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.NamedWindows
import XMonad.Prompt.ConfirmPrompt
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch
-- better implementation of dictionaries
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes.XF86

------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "alacritty"

-- The command to lock the screen or show the screensaver.
myLockscreen = "multilockscreen -l blur --off 600"
mySuspend = "systemctl suspend"

-- The command to take a fullscreen screenshot.
myScreenshot = "flameshot gui"
myScreenshotOnline = "imgur-screenshot"

-- The command to lookup an emoji
-- myEmoji = "splatmoji type"

-- The command to use as a launcher, to launch applications that don't have
-- preset keybindings.
myAppLauncher = "rofi -show drun"

-- Password manager command
-- myPasswordManager = "bwmenu -- -theme onedark"

-- Clipboard manager command
myClipboardManager = "rofi -show clipboard -modi 'clipboard:greenclip print' -run-command '{cmd}'"

-- Location of your xmobar.hs / xmobarrc
myXmobarrc = "~/.xmonad/xmobar.hs"

myWorkspaces = map show [1..9]

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myBorderWidth = 1

myLayouts = avoidStruts(
    spacingRaw False (Border 10 0 10 0) 
    True (Border 0 10 0 10) True 
    $ Tall 1 (3/100) (1/2) 
    ||| ThreeColMid 1 (3/100) (1/2))
    ||| noBorders (fullscreenFull Full)

black = "#2E3440"
primaryColor = "#4C566A"

myNormalBorderColor  = black
myFocusedBorderColor = primaryColor

xmobarTitleColor = "#e5e9f0"
xmobarCurrentWorkspaceColor = "#A3BE8C"
xmobarVisibleWorkspaceColor = "#FFFF00"

myGsconfig colorizer = (buildDefaultGSConfig colorizer) { gs_cellheight = 30, gs_cellwidth = 150 }
myColorizedConfig = colorRangeFromClassName
                        black -- lowest inactive bg
                        (0x70, 0xFF, 0x70)
                        black
                        white
                        white
    where
        black = minBound
        white = maxBound

myXPConfig = def {
    bgColor = "#2E3440",
    bgHLight = "#2E3440",
    fgColor = "#D8DEE9",
    fgHLight = "#A3BE8C",
    position = Top,
    promptBorderWidth = 0,
    searchPredicate = fuzzyMatch
}

myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ ((modMask, xK_Return), spawn $ XMonad.terminal conf)
  -- , ((modMask, xK_d), spawn myAppLauncher)
  , ((modMask, xK_d), runOrRaisePrompt myXPConfig)
  , ((modMask, xK_g), goToSelected $ myGsconfig myColorizedConfig)
  , ((modMask .|. shiftMask, xK_g), bringSelected $ myGsconfig myColorizedConfig)
  , ((modMask, xK_p), spawn myScreenshot)
  , ((modMask .|. shiftMask, xK_p), spawn myScreenshotOnline)
  , ((modMask, xK_x), spawn myLockscreen)
  , ((modMask .|. shiftMask, xK_x), spawn mySuspend)
  -- TODO confirm to shutdown pc (see also prompt input)
  -- , ((modMask , xK_Escape), confirmPrompt def "shutdown" $ io (exitWith ExitSuccess))
  -- , ((modMask .|. shiftMask, xK_d), windowMenu)
  , ((modMask, xK_c), spawn myClipboardManager)
  , ((0, xF86XK_AudioMute), spawn "pamixer --toggle-mute")
  , ((0, xF86XK_AudioLowerVolume), spawn "pamixer --decrease 5")
  , ((0, xF86XK_AudioRaiseVolume), spawn "pamixer --increase 5")
  , ((0, xF86XK_AudioPrev), spawn "playerctl previous")
  , ((0, xF86XK_AudioPlay), spawn "playerctl play-pause")
  , ((0, xF86XK_AudioNext), spawn "playerctl next")
  , ((0, xF86XK_MonBrightnessUp), spawn "brightnessctl set 10%+")
  , ((0, xF86XK_MonBrightnessDown), spawn "brightnessctl set 10%-")
  -- Xmonad config
  , ((modMask .|. shiftMask, xK_q), kill)
  , ((modMask, xK_space), sendMessage NextLayout)
  , ((modMask .|. shiftMask, xK_f), sendMessage (Toggle "Full"))
  , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
  , ((modMask, xK_n), refresh)
  -- , ((modMask, xK_i), sendMessage MirrorShrink)
  -- , ((modMask, xK_o), sendMessage MirrorExpand)
  , ((modMask, xK_Tab), windows W.focusDown)
  , ((modMask, xK_j), windows W.focusDown)
  , ((modMask, xK_k), windows W.focusUp  )
  , ((modMask, xK_m), windows W.focusMaster  )
  , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster)
  , ((modMask .|. shiftMask, xK_j), windows W.swapDown  )
  , ((modMask .|. shiftMask, xK_k), windows W.swapUp    )
  , ((modMask, xK_h), sendMessage Shrink)
  , ((modMask, xK_l), sendMessage Expand)
  , ((modMask, xK_t), withFocused $ windows . W.sink)
  , ((modMask, xK_comma), sendMessage (IncMasterN 1))
  , ((modMask, xK_period), sendMessage (IncMasterN (-1)))
  , ((modMask .|. shiftMask, xK_z), io (exitWith ExitSuccess))
  , ((modMask .|. shiftMask, xK_c), restart "xmonad" True)
  ]
  ++
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
  ++
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myLogHook = updatePointer (0.5, 0.5) (0, 0) -- exact centre of window

myManageHook = composeAll[ isFullscreen --> (doF W.focusDown <+> doFullFloat)]

main = do
    xmproc <- spawnPipe ("xmobar " ++ myXmobarrc)
    xmonad $ docks defaults {
        logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor xmobarTitleColor "" . shorten 100,
            ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "",
            ppSep = "   ",
            ppVisible = xmobarColor xmobarVisibleWorkspaceColor "" . wrap "[" "]"
        }
    }

defaults = def {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    -- mouseBindings      = myMouseBindings,

    -- hooks, layouts
    -- layoutHook         = smartBorders $ myLayouts,
    layoutHook            = myLayouts,
    manageHook         = myManageHook,
    -- startupHook        = myStartupHook
    logHook               = myLogHook
}



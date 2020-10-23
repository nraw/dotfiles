-- Install CLI and SpoonInstall --

require("hs.ipc")
hs.ipc.cliInstall()

-- https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
hs.loadSpoon("SpoonInstall")


------- ClipboardTool -------
spoon.SpoonInstall:andUse("ClipboardTool",
    { 
        fn = function(lawl)
            lawl:start()
            lawl.show_copied_alert = false
            lawl.show_in_menubar = false
            lawl.hist_size = 10
            lawl:bindHotkeys({
                show_clipboard = { "alt", "c" } 
            })
        end
    })


----------- Seal -------------
spoon.SpoonInstall:andUse("Seal",
               {
                 hotkeys = { show = { {"cmd", "shift"}, "space" } },
                 fn = function(s)
                   s:loadPlugins({"apps", "calc", "safari_bookmarks",
                                  "screencapture", "useractions"})
                   s.plugins.safari_bookmarks.always_open_with_safari = false
                   s.plugins.useractions.actions =
                     {

                     }
                   s:refreshAllCommands()
                 end,
                 start = true,
               }
)

------ Window tiling --------

-- Directional
spoon.SpoonInstall:andUse("MiroWindowsManager",
    {
        fn = function(lol)
            hs.window.animationDuration = 0.0
            lol:bindHotkeys({
              up = {"cmd", "k"},
              right = {"cmd", "l"},
              down = {"cmd", "j"},
              left = {"cmd", "h"},
              fullscreen = {{"cmd", "shift"}, "k"}
            })
        end
    }
)

-- Move to next screen
hs.hotkey.bind({"cmd", "shift"}, "l", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)

-- Move to previous screen
hs.hotkey.bind({"cmd", "shift"}, "h", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():previous())
end)

-- Hide
hs.hotkey.bind({"cmd", "shift"}, "j", function()
    local win = hs.window.focusedWindow();
    if not win then return end
win:minimize()
end)

------ Slight focus window highlight -----
hs.window.highlight.ui.overlay=true
hs.window.highlight.ui.overlayColor = {0,0,0,0.04}
hs.window.highlight.start()


-- local application = require "hs.application"

---- Directional Focus ------
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"},'l',function()hs.window.focusedWindow():focusWindowEast(nil, true, true)end)
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"},'h',function()hs.window.focusedWindow():focusWindowWest(nil, true, true)end)
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"},'k',function()hs.window.focusedWindow():focusWindowNorth(nil, true, true)end)
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"},'j',function()hs.window.focusedWindow():focusWindowSouth(nil, true, true)end)


--------- Switcher -----------
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{})
switcher_space.ui.fontName = 'Monaco'
switcher_space.ui.textSize = 15
switcher_space.ui.showTitles = false

hs.window.switcher.ui.ThumbnailSize = 256
hs.window.switcher.ui.showSelectedThumbnail = false
hs.window.switcher.ui.showSelectedTitle = false
-- alternatively, call .nextWindow() or .previousWindow() directly (same as hs.window.switcher.new():next())
hs.hotkey.bind('alt','tab',function()switcher_space:next()end, nil, function()switcher_space:next()end)
--hs.hotkey.bind('alt','tab',switcher_space.nextWindow,nil,switcher_space.nextWindow)
-- you can also bind to `repeatFn` for faster traversing
hs.hotkey.bind('alt-shift','tab',function()switcher_space:previous()end, nil, function()switcher_space:previous()end)
---hs.hotkey.bind('alt-shift','tab',switcher_space.previousWindow,nil,switcher_space.previousWindow)


------ HeadphoneAutoPause --------
spoon.SpoonInstall:andUse("HeadphoneAutoPause",
    {
        fn = function(hap)
            hap.autoResume = false
            hap:start()
        end
    }
)

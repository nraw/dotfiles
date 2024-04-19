-- Install CLI and SpoonInstall --

require("hs.ipc")
hs.ipc.cliInstall()

-- https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
hs.loadSpoon("SpoonInstall")

--- Reloading ---
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

------- Current Zoom  -------
hs.hotkey.bind({ "alt", "shift" }, "z", function()
	hs.open("/Users/Andrej_Marsic/applications/join.command")
end)

-- Broke for some reason

-- spoon.SpoonInstall:andUse("Zoom", {
--   fn = function(zoom)
--     zoom:start()
--     hs.hotkey.bind({ "cmd", "shift" }, "a", function()
--       -- TODO: If focused ether don't show or let the app handle
--       local status = zoom:toggleMute()
--       hs.alert.show(status)
--       -- hs.alert.show(zoom:getAudioStatus())
--     end)
--   end,
-- })

------- ClipboardTool -------
spoon.SpoonInstall:andUse("ClipboardTool", {
	fn = function(lawl)
		lawl:start()
		lawl.show_copied_alert = false
		lawl.show_in_menubar = false
		lawl.hist_size = 10
		lawl:bindHotkeys({
			show_clipboard = { "alt", "c" },
		})
	end,
})

------ Window tiling --------

-- Directional
spoon.SpoonInstall:andUse("MiroWindowsManager", {
	fn = function(lol)
		hs.window.animationDuration = 0.0
		lol:bindHotkeys({
			up = { { "cmd", "shift", "alt" }, "k" },
			right = { { "cmd", "shift" }, "l" },
			down = { { "cmd", "shift", "alt" }, "j" },
			left = { { "cmd", "shift" }, "h" },
			fullscreen = { { "cmd", "shift" }, "k" },
		})
	end,
})

-- Move to next screen
hs.hotkey.bind({ "cmd", "shift" }, "j", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	win:moveToScreen(win:screen():next())
end)

------ Slight focus window highlight -----
hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.overlayColor = { 0, 0, 0, 0.04 }
hs.window.highlight.start()

-- local application = require "hs.application"

---- Directional Focus ------
hs.hotkey.bind({ "alt", "shift", "cmd", "ctrl" }, "l", function()
	hs.window.focusedWindow():focusWindowEast(nil, true, true)
end)
hs.hotkey.bind({ "alt", "shift", "cmd", "ctrl" }, "h", function()
	hs.window.focusedWindow():focusWindowWest(nil, true, true)
end)
hs.hotkey.bind({ "alt", "shift", "cmd", "ctrl" }, "k", function()
	hs.window.focusedWindow():focusWindowNorth(nil, true, true)
end)
hs.hotkey.bind({ "alt", "shift", "cmd", "ctrl" }, "j", function()
	hs.window.focusedWindow():focusWindowSouth(nil, true, true)
end)

--------- Apps focus -----------
hs.hotkey.bind({ "alt" }, "1", function()
	hs.application.launchOrFocus("Alacritty")
end)
hs.hotkey.bind({ "alt" }, "2", function()
	hs.application.launchOrFocus("Google Chrome")
end)
hs.hotkey.bind({ "alt" }, "3", function()
	hs.application.launchOrFocus("Slack")
end)
hs.hotkey.bind({ "alt" }, "4", function()
	hs.application.launchOrFocus("Microsoft Outlook")
end)
hs.hotkey.bind({ "alt" }, "5", function()
	hs.application.launchOrFocus("zoom.us")
end)
hs.hotkey.bind({ "alt" }, "6", function()
	hs.application.launchOrFocus("Spotify")
end)

------ HeadphoneAutoPause --------
spoon.SpoonInstall:andUse("HeadphoneAutoPause", {
	fn = function(hap)
		hap.autoResume = false
		hap:start()
	end,
})
----------------- GRID STUFF ---------
hs.grid.setMargins({ w = 9, h = 9 })

-- Keybinding Index
--   Ctrl-Opt-Cmd - R - Reload Hammerspoon
--   Ctrl-Opt-Cmd - Y - Hide all windows
--   Ctrl-Opt-Cmd - \ - Lock screen

-- Shortcut Modifiers {{{

local coc = { 'control', 'option', 'command' }
local cc  = { 'control', 'command'           }
local co  = { 'control', 'option'            }
local oc  = { 'option',  'command'           }

-- }}}

-- Reload - Ctrl-Opt-Cmd-R {{{

hs.hotkey.bind(coc, 'r', nil, function()
  hs.alert.show('Reloading Hammerspoon')
  hs.reload()
end)

--}}}

-- Lockscreen - Ctrl-Opt-Cmd-\ {{{

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, '\\', function()
  hs.caffeinate.lockScreen()
end)

--}}}

-- Hide all windows - Ctrl-Opt-Cmd-Y {{{

hs.hotkey.bind(coc, 'y', nil, function()
  -- loop over all running applications
  local running = hs.application.runningApplications()
  for i, app in ipairs(running) do
    -- hide if not hidden
    if app:isHidden() == false then
      if app:name() ~= 'Finder' then
        app:hide()
      else
        -- except for Finder, for that, just close visible windows
        -- the 'Desktop' window will remain open
        for i,win in ipairs(app:visibleWindows()) do
          win:close()
        end
      end
    end
  end
end)

-- }}}

-- Invoke hints - Ctrl-Opt-Cmd-O {{{

hs.hotkey.bind(coc, 'o', nil, function()
  hs.hints.windowHints()
end)

-- }}}

-- Vim-like window navigation - Ctrl-Opt-Cmd-{hljk} {{{

hs.hotkey.bind(coc, 'h', function() if hs.window.focusedWindow() then hs.window.focusedWindow():focusWindowWest()  end end)
hs.hotkey.bind(coc, 'l', function() if hs.window.focusedWindow() then hs.window.focusedWindow():focusWindowEast()  end end)
hs.hotkey.bind(coc, 'j', function() if hs.window.focusedWindow() then hs.window.focusedWindow():focusWindowSouth() end end)
hs.hotkey.bind(coc, 'k', function() if hs.window.focusedWindow() then hs.window.focusedWindow():focusWindowNorth() end end)

-- }}}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

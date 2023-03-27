hyper = {'ctrl', 'alt', 'shift', 'cmd'}

hs.hotkey.bind(hyper, 'B', function ()
  hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind(hyper,  'C', function()
  hs.application.launchOrFocus('PyCharm')
end)

hs.hotkey.bind(hyper,  'T', function()
  hs.application.launchOrFocus('Kitty')
end)

hs.hotkey.bind(hyper,  'P', function()
  hs.application.launchOrFocus('KeePassXC')
end)

hs.hotkey.bind(hyper,  'N', function()
  hs.application.launchOrFocus('Obsidian')
end)

hs.hotkey.bind(hyper, 'up', function()
  hs.execute('yabai -m window --focus north', true)
end)

hs.hotkey.bind(hyper, 'down', function()
  hs.execute('yabai -m window --focus south', true)
end)

hs.hotkey.bind(hyper, 'left', function()
  hs.execute('yabai -m window --focus west', true)
end)

hs.hotkey.bind(hyper, 'right', function()
  hs.execute('yabai -m window --focus east', true)
end)

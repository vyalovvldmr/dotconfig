hyper = {"ctrl", "alt", "shift", "cmd"}

hs.hotkey.bind(hyper, "F", function ()
  hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind(hyper,  "P", function()
  hs.application.launchOrFocus('PyCharm CE')
end)

hs.hotkey.bind(hyper,  "A", function()
  hs.application.launchOrFocus('Alacritty')
end)

hs.hotkey.bind(hyper,  "C", function()
  hs.application.launchOrFocus('Calendar')
end)

hs.hotkey.bind(hyper,  "D", function()
  hs.application.launchOrFocus('Docker')
end)

hs.hotkey.bind(hyper,  "K", function()
  hs.application.launchOrFocus('KeePassXC')
end)

hs.hotkey.bind(hyper,  "O", function()
  hs.application.launchOrFocus('Obsidian')
end)

hs.hotkey.bind(hyper,  "S", function()
  hs.application.launchOrFocus('Slack')
end)

hs.hotkey.bind(hyper,  "M", function()
  hs.application.launchOrFocus('Spark Desktop')
end)

hs.hotkey.bind(hyper,  "T", function()
  hs.application.launchOrFocus('Telegram')
end)

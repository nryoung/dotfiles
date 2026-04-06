local send_escape = false
local last_modifiers = {}
local cancel_timer = hs.timer.delayed.new(0.115, function() send_escape = false end)

local ctrl_tap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(e)
  local flags = e:getFlags()

  if last_modifiers['ctrl'] == flags['ctrl'] then return false end

  if not last_modifiers['ctrl'] then
    last_modifiers = flags
    send_escape = true
    cancel_timer:start()
  else
    if send_escape then hs.eventtap.keyStroke({}, "escape", 1) end
    last_modifiers = flags
    cancel_timer:stop()
  end
  return false
end)

local key_tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function()
  send_escape = false
  return false
end)

ctrl_tap:start()
key_tap:start()

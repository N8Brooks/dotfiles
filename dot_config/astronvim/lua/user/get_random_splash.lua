local alphabet = require "user/alphabet"

-- TODO: (centered) line wrap
-- TODO: lowercase letters
-- TODO: more letters
-- TODO: improve letter shapes
-- TODO: grab splash by random line
-- TODO: remote splashes?

math.randomseed(os.time())

local xdg_config_home = os.getenv("XDG_CONFIG_HOME")

local splashes = {}
for line in io.lines(xdg_config_home .. "/astronvim/lua/user/splashes.txt") do
  table.insert(splashes, line)
end

local function chars(s)
  local t = {}
  for c in string.gmatch(s, ".") do
    table.insert(t, c)
  end
  return t
end

local function map(t, func)
  local res = {}
  for i, element in pairs(t) do
    res[i] = func(element)
  end
  return res
end

local function transpose(t)
  local res = {}
  for i = 1, #t[1] do
    res[i] = {}
    for j = 1, #t do
      res[i][j] = t[j][i]
    end
  end
  return res
end

local function get_block_letter(upper_letter)
  local block_letter = alphabet[upper_letter]
  if block_letter ~= nil then
    return block_letter
  else
    local line = string.rep(upper_letter, 7)
    return { line, line, line, line, line }
  end
end

local function concat_block_line(block_line) return table.concat(block_line, " ") end

function GetRandomSplash()
  local splash = splashes[math.random(#splashes)]
  local upper_letters = chars(string.upper(splash))
  local block_letters = map(upper_letters, get_block_letter)
  local block_lines = map(transpose(block_letters), concat_block_line)
  return table.concat(block_lines, "\n")
end


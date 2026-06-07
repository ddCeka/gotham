local Util = { }

function clamp(val, min, max)
  return math.max(math.min(val, max), min)
end

-- clamps the value in [0, 255] range (00-ff) and rounds to the nearest integer
local function clamp_channel(val)
  return math.floor(clamp(val, 0, 255) + 0.5)
end

-- linear blend
-- factor number should be in [0, 1] range.
-- 0 results in source value, 1 results target value
local function blend_channel(source_val, target_val, factor)
  local res = ((1 - factor) * source_val) + (factor * target_val)
  return clamp_channel(res)
end

-- for converting hex color substrings to numeric values
-- assume color in '#rrggbb'
function Util.red(color)
  return tonumber(color:sub(2, 3), 16)
end

function Util.green(color)
  return tonumber(color:sub(4, 5), 16)
end

function Util.blue(color)
  return tonumber(color:sub(6, 7), 16)
end

-- multiplies each of rr, gg, bb by non negative modifier to change brightness
-- it's equivalent to multiplying the value in HSV by the same amount
-- modifier > 1 brightens the color
-- modifier < 1 darkens the color
-- assumes color in '#rrggbb'
function Util.brighten(color, modifier)
  local r = Util.red(color)
  local g = Util.green(color)
  local b = Util.blue(color)
 
  if (r == nil) or (g == nil) or (b == nil) or (modifier < 0) then
    return nil
  end
 
  -- modify brightness, clamping and rounding the result
  r = clamp_channel(r * modifier)
  g = clamp_channel(g * modifier)
  b = clamp_channel(b * modifier)
 
  return ('#%02x%02x%02x'):format(r, g, b)
end

-- factor number should be in [0, 1] range. 0 results in source color, 1 results in target color
function Util.blend(source_color, target_color, factor)
  factor = clamp(factor, 0, 1) -- enforcing bounds

  local r = blend_channel(Util.red(source_color), Util.red(target_color), factor)
  local g = blend_channel(Util.green(source_color), Util.green(target_color), factor)
  local b = blend_channel(Util.blue(source_color), Util.blue(target_color), factor)

  return ('#%02x%02x%02x'):format(r, g, b)
end

-- blend to black
function Util.shade(color, factor)
  return Util.blend(color, '#000000', factor)
end

-- blend to white
function Util.tint(color, factor)
  return Util.blend(color, '#ffffff', factor)
end

return Util

--[[
  stb is recursive print function, specifically made for tables
]]
local function stb(tb)
  local s
  s = "{ "
  for k,v in pairs(tb) do
    local toAppend;
    local vType;
    toAppend = ""
    if type(k) ~= "number" then
      toAppend = toAppend..'"'..k..'" = '
    end
    vType = type(v);
    if vType == 'table' then
      toAppend = stb(v);
    else
      local vStr = tostring(v);
      if vType == "string" then
        vStr = '"'..vStr..'"';
      end
      toAppend = toAppend..vStr;
    end
    s = s..toAppend
    if next(tb, k) ~= nil then
      s = s..', '
    end
  end
  s = s.." }"
  return s
end

local function each(tb, cb)
  for key, val in pairs(tb) do
    cb(val, key, tb);
  end
end

local function map(tb, cb)
  local resTb = {}
  for val, key in pairs(tb) do
    local cbRes;
    cbRes = cb(val, key, tb);
    table.insert(resTb, cbRes);
  end
  return resTb;
end

local function reduce(tb, cb, acc)
  for k,v in pairs(tb) do
    acc = cb(acc, v, k, tb)
  end
  return acc
end

local function filter(tb, cb)
  local resTb = {};
  for k,v in pairs(tb) do
    local currRes = cb(v, k, tb);
    if currRes then
      resTb[k] = v;
    end
  end
  return resTb;
end

local arrayModule = {
  stb = stb,
  each = each,
  map = map,
  reduce = reduce,
  filter = filter,
}

return arrayModule

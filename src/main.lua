
local testArrays = require('./lib/test-arrays');

local function main()
  print('Hello World');
  testArrays();
end

(function ()
  main();
end)();

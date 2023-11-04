local array = require "../util/array"

local function testArrays()
  local arr = {1, 2, 3, 4}
  print(array.stb(arr))
  local arrPlus1 = array.map(arr, function (val)
    return val + 1
  end)
  print(array.stb(arrPlus1))
  array.each(arr, function (val, key)
    print(key..' = '..val)
  end)
  local arrSum = array.reduce(arr, function(acc, curr)
    return acc + curr
  end, 0)
  print('sum: '..arrSum);

  print('filter evens from:' .. array.stb(arr));
  local arrEvens = array.filter(arr, function(n)
    return n % 2 == 0;
  end);
  print(array.stb(arrEvens));

  print(array.stb({
    a = 'hi',
    b = 'bye',
    n = 2,
    o1 = {
      o1a = 'hi1',
      o1b = 'bye2',
      o1n = 55,
      o11 = {
        o11a = 'hi11',
        o11b = 'bye11',
      },
    },
  }))
end

return testArrays;

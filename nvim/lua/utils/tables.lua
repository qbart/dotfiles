local M = {}

M.contains = function (set, val)
  for _, value in pairs(set) do
    if value == val then return true end
  end
  return false
end

return M

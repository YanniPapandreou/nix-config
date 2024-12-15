local M = {}

M.get_hostname = function()
  local hostname = vim.uv.os_gethostname()
  return hostname
end

return M

P = function(v)
  print(vim.inspect(v))
  return v
end

Toggle = function(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    print("Set " .. option .. " to " .. vim.opt_local[option]:get())
    return
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      print("Enabled " .. option)
    else
      print("Disabled " .. option)
    end
  end
end


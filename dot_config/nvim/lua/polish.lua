-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local function mac_is_dark()
  local ok, out = pcall(vim.fn.system, { "defaults", "read", "-g", "AppleInterfaceStyle" })
  return ok and type(out) == "string" and out:match "Dark" ~= nil
end

local function sync_catppuccin()
  local bg = mac_is_dark() and "dark" or "light"
  vim.o.background = bg
  pcall(vim.cmd.colorscheme, "catppuccin")
end

vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "FocusGained" }, {
  callback = function() vim.schedule(sync_catppuccin) end,
})

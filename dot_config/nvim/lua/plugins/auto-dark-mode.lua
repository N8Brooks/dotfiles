-- @type LazySpec
return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    fallback = "dark",
    set_dark_mode = function()
      vim.api.nvim_set_option_value("background", "dark", {})
      vim.cmd.colorscheme "catppuccin-macchiato"
    end,
    set_light_mode = function()
      vim.api.nvim_set_option_value("background", "light", {})
      vim.cmd.colorscheme "catppuccin-latte"
    end,
  },
  init = function()
    -- optional: load correct theme immediately on startup
    local mode = vim.fn.system "defaults read -g AppleInterfaceStyle 2>/dev/null"
    if mode:match "Dark" then
      vim.api.nvim_set_option_value("background", "dark", {})
      vim.cmd.colorscheme "catppuccin-macchiato"
    else
      vim.api.nvim_set_option_value("background", "light", {})
      vim.cmd.colorscheme "catppuccin-latte"
    end
  end,
}

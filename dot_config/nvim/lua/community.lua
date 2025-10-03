-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- colorscheme
  {
    import = "astrocommunity.colorscheme.catppuccin",
    flavour = "auto",
    background = {
      light = "latte",
      dark = "macchiato",
    },
  },

  -- completion
  { import = "astrocommunity.completion.copilot-lua" },

  -- editing support
  { import = "astrocommunity.editing-support.refactoring-nvim" },

  -- git
  { import = "astrocommunity.git.git-blame-nvim" },

  -- pack
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.python" },
}

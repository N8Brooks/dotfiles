---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                ST1000 = false, -- at least one file in a package should have a package comment
                ST1003 = false, -- should not use underscores in package names
              },
            },
          },
        },
      },
    },
  },
}

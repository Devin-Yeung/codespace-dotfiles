local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require("plugins.configs.cmp")
      -- I prefer not to select the first one (noselect)
      opts.completion.completeopt = "menu,menuone,noselect"
      return opts
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require("custom.configs.conform")
    end,
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    init = function()
      -- https://github.com/mrcjkb/rustaceanvim/discussions/46#discussioncomment-7636177
      require("lsp-inlayhints").setup()
      -- override the InlayHint color with onedark bg
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "", bg = "#1e222a" })
      -- toggle
      require("lsp-inlayhints").toggle()
    end,
  },
  -- avoid CPU stucking in M3 mac
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

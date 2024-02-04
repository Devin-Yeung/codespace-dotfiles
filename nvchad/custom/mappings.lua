---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },

    --  format selected line with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting the selected line",
    },
  },
}

-- more keybinds!
M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-L>"] = { -- TAB
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-H>"] = { -- <S-Tab>
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<leader>qf"] = { -- quick fix
      function()
        vim.lsp.buf.code_action()
      end,
      "Quick fix using lsp",
    },
  },
}

return M

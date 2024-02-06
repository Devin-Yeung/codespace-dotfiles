-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- I prefer the original leader key
vim.g.mapleader = "\\"

-- override the InlayHint color with onedark bg
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "", bg = "#1e222a" })

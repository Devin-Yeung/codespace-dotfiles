local M = {}

M.treesitter = {
	ensure_installed = {
		"c",
		"vim",
		"lua",
		"rust",
		"toml",
		"markdown",
		"markdown_inline",
		-- "html",
		-- "css",
		-- "javascript",
		-- "typescript",
		-- "tsx",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- rust stuff
		"rust-analyzer",
		"rustfmt",

		-- lua stuff
		"lua-language-server",
		"stylua",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- web dev stuff
		-- "css-lsp",
		-- "html-lsp",
		-- "typescript-language-server",
		-- "deno",
		-- "prettier",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M

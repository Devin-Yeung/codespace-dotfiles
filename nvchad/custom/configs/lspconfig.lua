local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "clangd", "rust_analyzer", "pyright", "ruff_lsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = function(client, bufnr)
      -- https://github.com/mrcjkb/rustaceanvim/discussions/46#discussioncomment-7636177
      require("lsp-inlayhints").setup() -- any better place ?
      on_attach(client, bufnr)
      require("lsp-inlayhints").on_attach(client, bufnr)
      require("lsp-inlayhints").show()
    end,
    capabilities = capabilities,
  })
end

--
-- lspconfig.pyright.setup { blabla}

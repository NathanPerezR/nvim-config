local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local defaultServers = { "html", "cssls", "tsserver", "clangd", "jdtls", "rust_analyzer"}

for _, lsp in ipairs(defaultServers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true}
    }
  }
}

 lspconfig.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy";
            },
            diagnostics = {
                enable = true;
            }
        }
    }
}

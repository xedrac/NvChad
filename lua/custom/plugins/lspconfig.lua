
local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   -- lspservers with default config
   local servers = { "rust_analyzer", "clangd", }
   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
           debounce_text_changes = 150,
         },
      }
    end

    -- rust
    lspconfig.rust_analyzer.setup {
       on_attach = function(client, bufnr)
          -- client.resolved_capabilities.document_formatting = false
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
       end,
    }

    lspconfig.clangd.setup {
       on_attach = function(client, bufnr)
          -- set options here
       end
    }
end

return M

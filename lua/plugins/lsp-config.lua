return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jdtls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Helper for LSP keymaps
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      -- New way to configure servers in Neovim 0.11+
      vim.lsp.config["lua_ls"] = {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
     }

    vim.lsp.config["jdtls"] = {
      on_attach = on_attach,
    }

    -- Actually start/attach the servers
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("jdtls")
  end,
  }
}

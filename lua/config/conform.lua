require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt" },
  },
  format_on_save = function(bufnr)
    -- Skip formatting generated/minified files if needed later.
    return {
      timeout_ms = 1000,
      lsp_format = "fallback",
    }
  end,
}

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format {
    async = true,
    lsp_format = "fallback",
  }
end, { desc = "format buffer or selection" })

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "emmet-ls",
        "eslint-lsp",
        "stylelint-lsp",
        "tailwindcss-language-server",
        "unocss-language-server",
        "vue-language-server",
        "vetur-vls",
      })
    end,
  },
}

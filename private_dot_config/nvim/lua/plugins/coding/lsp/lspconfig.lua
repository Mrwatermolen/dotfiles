return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
          require("lazyvim.util").lsp.on_attach(function(client, bufnr)
            if client.name == "clangd" then
              require("lsp-inlayhints").on_attach(client, bufnr)
            end
          end)
        end,
      },
    },
  },
}

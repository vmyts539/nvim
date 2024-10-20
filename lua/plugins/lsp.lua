return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 30000,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false, -- Disable type hints for variables
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
              },
            },
          },
        },
      },
    },
  },
}

-- LSP related addtional configuration

local diag_format = function(d)
  local code = d.code or (d.user_data and d.user_data.lsp.code)
  if code then
    return string.format("%s (%s)", d.message, code):gsub("1. ", "")
  end
  return d.message
end

return {
  -- Show error code in virtual text output
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    opts = {
      autoformat = false,
      virtual_text = {
        format = diag_format,
      },
    },
  },

  -- Tools like language server, debug adapters, linters and formatters
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- language servers
        "ansible-language-server",
        "bash-language-server",
        "lua-language-server",
        "pyright",
        "yaml-language-server",
        -- debug adapters
        -- linters
        "ansible-lint",
        "flake8",
        "selene",
        "shellcheck",
        -- formatters
        "isort",
        "stylua",
        "shfmt",
      })
    end,
  },
}

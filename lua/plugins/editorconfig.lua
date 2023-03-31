-- Setup editorconfig plugin
-- see https://github.com/editorconfig/editorconfig-vim

return {
  {
    "editorconfig/editorconfig-vim",
    enabled = true,
    event = "BufRead",
    init = function()
      vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
    end,
  },
}

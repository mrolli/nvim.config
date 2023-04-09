-- Setup <PLUGIN> plugin
-- see https://github.com/<OWNER>/<PLUGIN>.nvim

local diag_format = function(d)
  local code = d.code or (d.user_data and d.user_data.lsp.code)
  if code then
    return string.format("%s (%s)", d.message, code):gsub("1. ", "")
  end
  return d.message
end

return {
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
}

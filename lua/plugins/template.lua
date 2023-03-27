-- Setup <PLUGIN> plugin
-- see https://github.com/<OWNER>/<PLUGIN>.nvim

-- remove these two lines upon copying this template
if true then return {} end

return {
  "<OWNER>/<PLUGIN>",
  enabled = true,
  config = function()
    require("<PLUGIN>").setup({

    })
  end,
}

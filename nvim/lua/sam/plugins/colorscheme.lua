return { "ellisonleao/gruvbox.nvim",
priority = 1000 ,
config = true,
config = function()
  require("gruvbox").setup({
    inverse = true,
    contrast = "hard",
    transparent_mode = true,
  })
  vim.cmd("colorscheme gruvbox")
end
}

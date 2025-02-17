vim.go.background = "light"

return {
  -- add gruvbox
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dayfox",
      background = "light",
    },
  },
}

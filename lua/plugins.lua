require("lazy").setup({
 
  -- 1. サイドバー (nvim-tree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        git = { enable = true, ignore = false, timeout = 500 },
      })
    end,
  },

  -- 2. 上部タブ (bufferline)
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({})
    end,
  },

  -- 3. カラースキーム（見た目をかっこよくするなら）
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
})

require("lazy").setup({

  -- treesitter
  -- description: display code color
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "python", "lua", "vim", "vimdoc" },
      highlight = { 
        enable = true, 
      },
      indent = { enable = true },
    },
  },

  -- lspconfig
  -- description: activate ruff and pyright
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        pyright = {},
        ruff = {},
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },

  -- mason
  -- description: setup for  LSP server
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = { "pyright", "ruff" },
    },
  },

  -- git sign
  -- description: display git diffs
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = 'A' },
        change       = { text = 'U' },
        delete       = { text = 'D' },
        topdelete    = { text = 'D' },
        changedelete = { text = 'D' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
    },
  },


  -- nvim-tree
  -- discription: display file explore
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left"
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500
        },
      })
    end,
  },
  
  -- bufferline
  -- description: display upper tab
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        always_show_bufferline = true,
      },
    },
  }, 
})

local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Sync/Obsidan/main-vault/",
        },
      },
    },
    mappings = {},
  },
  {
    "ggandor/leap.nvim",
    config = function()
    require("leap").add_default_mappings()
    end,
    lazy = false,
  },
  {
    "karb94/neoscroll.nvim",
    config = function ()
        require('neoscroll').setup {}
      end,
    lazy = false,
  },
  {
    "RaafatTurki/hex.nvim",
    config = function()
      require("hex").setup {
        -- cli command used to dump hex data
        dump_cmd = 'xxd -g 1 -u',
        
        -- cli command used to assemble from hex data
        assemble_cmd = 'xxd -r',
        
        -- function that runs on BufReadPre to determine if it's binary or not
        is_buf_binary_pre_read = function()
          -- logic that determines if a buffer contains binary data or not
          -- must return a bool
          return false -- Replace with actual logic
        end,
        
        -- function that runs on BufReadPost to determine if it's binary or not
        is_buf_binary_post_read = function()
          -- logic that determines if a buffer contains binary data or not
          -- must return a bool
          return false -- Replace with actual logic
        end,
      }
    end,
    lazy = false,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by defaulf
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}
return plugins

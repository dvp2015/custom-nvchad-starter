--@type NvPluginSpec

-- mostly borrowed from https://github.com/siduck/dotfiles/blob/master/nvim/lua/plugins/init.lua

return {

  --------------------------------------- default plugins -----------------------------------------

  {
    "rachartier/tiny-glimmer.nvim",
    keys = { "u", "<c-r>" },
    opts = {
      overwrite = {
        redo = {
          enabled = true,
          default_animation = {
            settings = {
              from_color = "DiffAdd",
            },
          },
        },

        undo = {
          enabled = true,
          default_animation = {
            settings = {
              from_color = "DiffDelete",
            },
          },
        },
      },
    },
  },

  {
    "nvzone/typr",
    cmd = { "Typr", "TyprStats" },
    opts = {
      wpm_goal = 120,
      stats_filepath = vim.fn.stdpath "data" .. "/config",
    },
  },
  { "nvzone/volt", lazy = true },
  { 
    "nvzone/minty",
    cmd = {"Shades", "Huefy"}
  },
  { "nvzone/showkeys", cmd = "ShowkeysToggle" },
  {
    "nvzone/timerly",
    opts = {
      on_start = function()
        vim.notify "Timerly started"
      end,
      on_finish = function()
        vim.cmd "silent !doas rtcwake -s 300 -m mem"
      end,
    },
    cmd = "TimerlyToggle",
  },

  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = function()
        return require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  --   'Wansmer/langmapper.nvim',
  --   lazy = false,
  --   priority = 1, -- High priority is needed if you will use `autoremap()`
  --   config = function()
  --     require('langmapper').setup() -- try default mapping
  --   end,
  -- },

  {
    "folke/which-key.nvim",
    enabled = true,
    dependencies = { "Wansmer/langmapper.nvim" },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local lmu = require "langmapper.utils"
      local view = require "which-key.view"
      local execute = view.execute

      -- wrap `execute()` and translate sequence back
      view.execute = function(prefix_i, mode, buf)
        -- Translate back to English characters
        prefix_i = lmu.translate_keycode(prefix_i, "default", "ru")
        execute(prefix_i, mode, buf)
      end

      -- If you want to see translated operators, text objects and motions in
      -- which-key prompt
      -- local presets = require('which-key.plugins.presets')
      -- presets.operators = lmu.trans_dict(presets.operators)
      -- presets.objects = lmu.trans_dict(presets.objects)
      -- presets.motions = lmu.trans_dict(presets.motions)
      -- etc

      require("which-key").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "markdown",
        "c",
        "bash",
        "lua",
        "tsx",
        "typescript",
        "rust",
      },
    },
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
      },
    },
  },
  --------------------------------------------- custom plugins ----------------------------------------------
  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup {}
    end,
  },

  { "folke/trouble.nvim", cmd = "Trouble", opts = {} },
  { "elkowar/yuck.vim", ft = "yuck", dependencies = "gpanders/nvim-parinfer" },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },

    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "2kabhishek/nerdy.nvim" },
    },
  },

  { "jbyuki/venn.nvim", cmd = "VBox" },

  { import = "nvchad.blink.lazyspec" },

  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      preview = {
        filetypes = { "md", "markdown", "codecompanion" },
      },
    },
  },
  
}

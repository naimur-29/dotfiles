-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- == THEME EDIT Example ==:
  --
  -- {
  --   "uloco/bluloco.nvim",
  --   lazy = false, -- Load immediately
  --   priority = 1000, -- Load before other plugins
  --   config = function()
  --     require("bluloco").setup {
  --       style = "auto", -- "auto" | "dark" | "light"
  --       transparent = true, -- Enable transparency
  --       italics = false,
  --       terminal = vim.fn.has "gui_running" == 1, -- Enable in GUI terminals
  --       guicursor = true,
  --     }
  --     vim.opt.termguicolors = true -- Enable true colors
  --     vim.cmd "colorscheme bluloco" -- Set the colorscheme
  --   end,
  -- },
  --
  --
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  "RRethy/base16-nvim",
  {
    "RRethy/base16-nvim",
    lazy = false, -- load immediately so that the colorscheme is available
    priority = 1000, -- ensure it loads before other UI-related plugins
    config = function()
      vim.opt.termguicolors = true -- ensure truecolor support is enabled
      --
      -- ## To disable highlights for supported plugin(s), call the `with_config` function **before** setting the colorscheme.
      -- ## These are the defaults.
      require("base16-colorscheme").with_config {
        telescope = false,
        indentblankline = true,
        notify = true,
        ts_rainbow = true,
        cmp = true,
        illuminate = true,
        dapui = true,
      }
      --
      -- ## Set your preferred base16 theme.
      -- ## All builtin colorschemes can be accessed with |:colorscheme|.
      vim.cmd "colorscheme base16-black-metal-gorgoroth"
      -- vim.cmd "colorscheme base16-gruvbox-dark-hard"
      --
      -- ## Alternatively, you can provide a table specifying your colors to the setup function.
      require("base16-colorscheme").setup {
        base00 = "#1a1a1a", -- Background: very dark
        base01 = "#2a2a2a",
        base02 = "#3a3a3a",
        base03 = "#7a7a7a", -- Comments color
        base04 = "#5a5a5a",
        base05 = "#cacaca", -- Default text: bright silver for more pronounced contrast
        base06 = "#e0e0e0",
        base07 = "#cacaca", -- Lightest foreground
        base08 = "#cacaca",
        base09 = "#cacaca",
        base0A = "#cacaca",
        base0B = "#cacaca",
        base0C = "#cacaca",
        base0D = "#cacaca",
        base0E = "#cacaca",
        base0F = "#cacaca",
        --
        -- base00 = "#1a1a1a", -- Background: very dark
        -- base01 = "#2a2a2a",
        -- base02 = "#3a3a3a",
        -- base03 = "#4a4a4a",
        -- base04 = "#5a5a5a",
        -- base05 = "#cacaca", -- Default text: bright silver for more pronounced contrast
        -- base06 = "#e0e0e0",
        -- base07 = "#cacaca", -- Lightest foreground
        -- base08 = "#cacaca",
        -- base09 = "#cacaca",
        -- base0A = "#cacaca",
        -- base0B = "#cacaca",
        -- base0C = "#cacaca",
        -- base0D = "#cacaca",
        -- base0E = "#cacaca",
        -- base0F = "#cacaca",
        --
        -- base00 = "#1a1a1a", -- Background: very dark
        -- base01 = "#2a2a2a",
        -- base02 = "#3a3a3a",
        -- base03 = "#4a4a4a",
        -- base04 = "#5a5a5a",
        -- base05 = "#cacaca", -- Default text: bright silver for more pronounced contrast
        -- base06 = "#e0e0e0",
        -- base07 = "#cacaca", -- Lightest foreground
        -- Accent colors (all in grayscale, with increased contrast)
        -- base07 = "#f0f0f0", -- Lightest foreground
        -- base08 = "#404040",
        -- base09 = "#505050",
        -- base0A = "#606060",
        -- base0B = "#707070",
        -- base0C = "#808080",
        -- base0D = "#909090",
        -- base0E = "#a0a0a0",
        -- base0F = "#b0b0b0",
      }
    end,
  },
  "folke/flash.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  "stevearc/oil.nvim",
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                     /$$   /$$             /$$",
        "                    | $$$ | $$            | $$",
        "                    | $$$$| $$  /$$$$$$  /$$$$$$",
        "                    | $$ $$ $$ /$$__  $$|_  $$_/",
        "                    | $$  $$$$| $$  \\ $$  | $$",
        "                    | $$\\  $$$| $$  | $$  | $$ /$$",
        "                    | $$ \\  $$|  $$$$$$/  |  $$$$/",
        "                    |__/  \\__/ \\______/    \\___/",
        " ",
        "   /$$    /$$  /$$$$$$         /$$$$$$                  /$$",
        "  | $$   | $$ /$$__  $$       /$$__  $$                | $$",
        "  | $$   | $$| $$  \\__/      | $$  \\__/  /$$$$$$   /$$$$$$$  /$$$$$$",
        "  |  $$ / $$/|  $$$$$$       | $$       /$$__  $$ /$$__  $$ /$$__  $$",
        "   \\  $$ $$/  \\____  $$      | $$      | $$  \\ $$| $$  | $$| $$$$$$$$",
        "    \\  $$$/   /$$  \\ $$      | $$    $$| $$  | $$| $$  | $$| $$_____/",
        "     \\  $/   |  $$$$$$/      |  $$$$$$/|  $$$$$$/|  $$$$$$$|  $$$$$$$",
        "      \\_/     \\______/        \\______/  \\______/  \\_______/ \\_______/",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      icons = {
        ActiveLSP = "",
        ActiveTS = " ",
        BufferClose = "",
        DapBreakpoint = "",
        DapBreakpointCondition = "",
        DapBreakpointRejected = "",
        DapLogPoint = "",
        DapStopped = "",
        DefaultFile = "",
        Diagnostic = "",
        DiagnosticError = "",
        DiagnosticHint = "",
        DiagnosticInfo = "",
        DiagnosticWarn = "",
        Ellipsis = "",
        FileModified = "",
        FileReadOnly = "",
        FoldClosed = "",
        FoldOpened = "",
        FolderClosed = "",
        FolderEmpty = "",
        FolderOpen = "",
        Git = "",
        GitAdd = "",
        GitBranch = "",
        GitChange = "",
        GitConflict = "",
        GitDelete = "",
        GitIgnored = "",
        GitRenamed = "",
        GitStaged = "",
        GitUnstaged = "",
        GitUntracked = "",
        LSPLoaded = "",
        LSPLoading1 = "",
        LSPLoading2 = "",
        LSPLoading3 = "",
        MacroRecording = "",
        Paste = "",
        Search = "",
        Selected = "",
        TabClose = "",
      },
    },
  },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      opts.mode = "symbol_text"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
    end,
  },
}

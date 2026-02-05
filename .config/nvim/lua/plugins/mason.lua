-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        -- add more arguments for adding more language servers
        "cssls",
        "elixirls",
        "emmet_ls",
        "eslint",
        "html",
        "jsonls",
        "tailwindcss",
        "ts_ls",
        "zls",
        "rust_analyzer",
        "gopls",
        -- "golangci_lint_ls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   -- overrides `require("mason-null-ls").setup(...)`
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       -- add more arguments for adding more null-ls sources
  --       "clang-format",
  --       "prettierd",
  --       "gofumpt",
  --       "goimports-reviser",
  --       "golines",
  --       "golangci-lint",
  --       "revive",
  --       "staticcheck",
  --     },
  --   },
  -- },
  {
    "jay-babu/mason-null-ls.nvim",
    -- We use a function to access the current 'opts' from AstroNvim
    opts = function(_, opts)
      -- 1. Ensure 'isort' is removed from the installation list
      if opts.ensure_installed then
        opts.ensure_installed = vim.tbl_filter(function(v) return v ~= "isort" end, opts.ensure_installed)
      end

      -- 2. Add your desired tools to the list
      local extra_tools = {
        "stylua",
        "clang-format",
        "prettierd",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "golangci-lint",
        "revive",
        "staticcheck",
        "flake8", -- Added flake8
      }
      -- Merge your list into the existing one
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, extra_tools)

      -- 3. Explicitly tell Mason NOT to auto-install isort if it sees it in a config
      opts.automatic_installation = {
        exclude = { "isort" },
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
        "js-debug-adapter",
      },
    },
  },
}

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        --     sh = { "shfmt" },
        clojure = { "cljstyle" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = false,
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "fzf-lua",
    keys = {
      -- change a keymap
      { "<leader>p", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git)" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "clojure",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = false,
      },
    },
  },
  {
    "CamdenClark/carrier.nvim",
    dir = "~/carrier.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    keys = {
      { "v", "<leader>ae", "<cmd>CarrierSuggestEdit<cr>", desc = "Edit visual selection" },
      { "<leader>as", "<cmd>CarrierSuggestAddition<cr>", desc = "Suggest addition" },
      { "<leader>ac", "<cmd>CarrierCancel<cr>", desc = "Cancel carrier suggestion" },
      { "<leader>ar", "<cmd>CarrierReject<cr>", desc = "Reject carrier suggestion" },
      { "<leader>aa", "<cmd>CarrierAccept<cr>", desc = "Accept carrier suggestion" },
    },
    opts = vim.env.MACHINE == "work" and {
      provider = "azure",
      config = {
        api_key = vim.env.AZURE_OPENAI_GPT4_TOKEN,
        endpoint = vim.env.AZURE_API_BASE,
        deployment = "gpt-4o",
      },
    } or {
      provider = "deepseek",
      config = {
        api_key = vim.env.DEEPSEEK_API_KEY,
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    dependencies = {
      "tpope/vim-rhubarb",
      "https://git.sr.ht/~willdurand/srht.vim",
    },
    keys = {
      { "<Leader>gb", "<cmd>GBrowse!<CR>", "Copy github link to clipboard" },
      { "v", "<Leader>gb", "<cmd>'<, '>GBrowse!<CR>", "Copy github link to clipboard" },
    },
  },
  {
    "Olical/conjure",
    ft = { "clojure", "lua", "python" },
    config = function(_, _)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
      vim.g["conjure#extract#tree_sitter#enabled"] = true
    end,
    keys = {
      { "<LocalLeader>cw", "<cmd>ConjureShadowSelect<Space>", desc = "shadow-cljs select" },
    },
  },
}

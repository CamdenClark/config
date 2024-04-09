return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        --     sh = { "shfmt" },
        clojure = { "cljstyle" },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- change a keymap
      { "<leader>p", "<cmd>Telescope git_files<cr>", desc = "Find Files" },
    },
    opts = {
      find_files = {
        hidden = true,
      },
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
    "CamdenClark/flyboy",
    -- dir = "~/flyboy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    opts = {
      model = "gpt-4",
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
      { "<leader>ae", "<cmd>CarrierEditSelection<cr>", desc = "Edit visual selection" },
      { "<leader>ao", "<cmd>CarrierLogOpen<cr>", desc = "Open Carrier log" },
      { "<leader>as", "<cmd>CarrierSendMessage<cr>", desc = "Send message" },
      { "<leader>ak", "<cmd>CarrierStopMessage<cr>", desc = "Stop completion stream" },
      { "<leader>aq", "<cmd>CarrierQuickMessage<cr>", desc = "Quick ask" },
    },
    opts = {
      model = "gpt-4-1106-preview",
      url = vim.env.AZURE_OPENAI_GPT4_ENDPOINT,
      headers = {
        Api_Key = vim.env.AZURE_OPENAI_GPT4_TOKEN,
        Content_Type = "application/json",
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
      { "<Leader>gb", "<cmd>GBrowse!<CR>" },
      { "v", "<Leader>gb", "<cmd>'<, '>GBrowse!<CR>" },
    },
  },
  {
    "Olical/conjure",
    ft = { "clojure", "lua" },
    config = function(_, _)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
      vim.g["conjure#extract#tree_sitter#enabled"] = true
    end,
    keys = {
      { "<leader>cw", "<cmd>ConjureShadowSelect<Space>", desc = "shadow-cljs select" },
    },
  },
}

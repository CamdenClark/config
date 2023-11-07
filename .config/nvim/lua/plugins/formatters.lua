return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        clojure = { "cljstyle" },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- change a keymap
      { "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
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
    },
  },
  {
    "CamdenClark/flyboy",
    -- dir = "~/flyboy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    keys = {
      { "<leader>ao", "<cmd>FlyboyOpen<cr>", desc = "Open flyboy" },
      { "<leader>as", "<cmd>FlyboySendMessage<cr>", desc = "Send message" },
      { "<leader>av", "<cmd>FlyboyOpenVSplit<cr>", desc = "Open flyboy (vertical)" },
      { "v", "<leader>av", "<cmd>FlyboyOpenVSplit visual<cr>", desc = "Open flyboy (vertical)" },
    },
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
    },
    opts = {
      model = "gpt-3.5-turbo-1106",
    },
  },
  {
    "tpope/vim-fugitive",
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

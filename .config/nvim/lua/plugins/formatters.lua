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
    dir = "~/flyboy",
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
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
      "https://git.sr.ht/~willdurand/srht.vim",
    },
  },
  {
    "Olical/conjure",
    keys = {
      { "<leader>cw", "<cmd>ConjureShadowSelect<Space>", desc = "shadow-cljs select" },
    },
  },
}

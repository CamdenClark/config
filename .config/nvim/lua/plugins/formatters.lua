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
      { "<leader>ae", "<cmd>CarrierSuggestEdit<cr>", desc = "Edit visual selection" },
      { "<leader>as", "<cmd>CarrierSuggestAddition<cr>", desc = "Edit visual selection" },
      { "<leader>ac", "<cmd>CarrierCancel<cr>", desc = "Cancel carrier suggestion" },
      { "<leader>ar", "<cmd>CarrierReject<cr>", desc = "Reject carrier suggestion" },
      { "<leader>aa", "<cmd>CarrierAccept<cr>", desc = "Accept carrier suggestion" },
    },
    opts = vim.env.MACHINE == "work" and {
      model = "gpt-4o",
      url = vim.env.AZURE_OPENAI_GPT4_ENDPOINT,
      headers = {
        Api_Key = vim.env.AZURE_OPENAI_GPT4_TOKEN,
        Content_Type = "application/json",
      },
    } or {
      provider = "deepseek",
      config = {
        api_key = vim.env.DEEPSEEK_API_KEY,
      },
    },
  },
  {
    "robitx/gp.nvim",
    config = function()
      if vim.env.MACHINE == "work" then
        require("gp").setup({
          openai_api_key = vim.env.AZURE_OPENAI_GPT4_TOKEN,
          openai_api_endpoint = vim.env.AZURE_OPENAI_GPT4_ENDPOINT,
        })
      else
        require("gp").setup()
      end

      -- or setup with your own config (see Install > Configuration in Readme)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
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
    "CopilotC-Nvim/CopilotChat.nvim",

    keys = {},
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

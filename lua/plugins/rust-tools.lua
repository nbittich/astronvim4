return {
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
          show_parameter_hints = false,
        },
      },
    },
  }, -- add lsp plugin
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      setup_handlers = {
        -- add custom handler
        rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
      },
    },
  },
  {
    "Saecki/crates.nvim",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          CmpSourceCargo = {
            {
              event = "BufRead",
              desc = "Load crates.nvim into Cargo buffers",
              pattern = "Cargo.toml",
              callback = function()
                require("cmp").setup.buffer { sources = { { name = "crates" } } }
                require "crates"
              end,
            },
          },
        },
      },
    },
    opts = {
      src = {
        cmp = { enabled = true },
      },
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust_analyzer" }, -- automatically install lsp
    },
  },
}

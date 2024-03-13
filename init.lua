return {
  -- Configuração dos plugins
  plugins = {
    -- nvim-dap
    { "mfussenegger/nvim-dap", enabled = true },
    -- codeium.vim para autocompletar
    { 'Exafunction/codeium.vim', event = 'BufEnter' },
    -- dressing.nvim para melhorar a UI
    {
      'stevearc/dressing.nvim',
      opts = {
        select = {
          enabled = true,
          backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        },
        input = {
          enabled = true,
        },
      },
    },
    -- mason-nvim-dap para gerenciar debuggers
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        ensure_installed = { "python" }, -- Lista de debuggers a serem instalados automaticamente
      }
    },
    -- Adicione mais plugins conforme necessário
  },

  -- Configuração do atualizador do AstroNvim
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
    remotes = {},
  },

  -- Definindo o esquema de cores
  colorscheme = "kanagawa-dragon",

  -- Configurações de diagnóstico
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Configurações do LSP
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
  },

  -- Configurações adicionais do lazy
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- Ícones personalizados
  icons = {
    ActiveLSP = "",
    -- Adicione mais ícones conforme necessário
  },

  -- Função polish para configurações finais
  polish = function()
    -- Configurações que devem ser aplicadas após o carregamento completo
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Configuração do tema Kanagawa
        require('user.config.kanagawa')

        -- Configuração do Dressing
        require('user.config.dressing')

        -- Configuração do browse.nvim
        require('user.config.browse')

      end
    })
  end,
}
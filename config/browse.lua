-- default values for the setup
require('browse').setup({
    -- search provider you want to use
    provider = "duckduckgo", -- google, duckduckgo, bing

    -- either pass it here or just pass the table to the functions
    -- see below for more
    bookmarks = {
      -- Adicione seus bookmarks aqui
      ['Buscadores'] = {
        ['name'] = 'Buscadores',
        ['google'] = 'https://google.com/',
        ['bing'] = 'https://bing.com/',
        ['duckduckgo'] = 'https://duckduckgo.com/',
      },
      ['GitHub'] = {
        ['name'] = 'GitHub',
        ['code_search'] = 'https://github.com/search?q=%s&type=code',
        ['repo_search'] = 'https://github.com/search?q=%s&type=repositories',
        ['issues_search'] = 'https://github.com/search?q=%s&type=issues',
        ['pulls_search'] = 'https://github.com/search?q=%s&type=pullrequests',
      },
      ['Reddit'] = 'https://reddit.com',
      ['Stack Overflow'] = 'https://stackoverflow.com',
      -- Adicione mais bookmarks conforme necessário
    },
    icons = {
        bookmark_alias = "->", -- if you have nerd fonts, you can set this to ""
        bookmarks_prompt = "", -- if you have nerd fonts, you can set this to "󰂺 "
        grouped_bookmarks = "->", -- if you have nerd fonts, you can set this to 
    }
})

        -- Definir um comando personalizado para :Browse
vim.cmd("command! Browse lua require('browse').browse()")

-- Mapeamento de teclas para o comando :Browse
vim.api.nvim_set_keymap('n', 'b', ':Browse<CR>', { noremap = true, silent = true })
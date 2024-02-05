-- Github copilot integration
return {
    "github/copilot.vim",
    config = function()
        vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
        vim.keymap.set('i', '<C-j>', '<Plug>(copilot-accept-line)')
    end,
}

return {
    'rmagatti/session-lens',
    lazy = false,
    dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
        require('auto-session').setup {
            auto_save_enabled = true,
            auto_restore_enabled = true,
        }
        require('telescope').load_extension('session-lens')

        vim.keymap.set('n', '<leader>fs', require('session-lens').search_session)

        vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end
}

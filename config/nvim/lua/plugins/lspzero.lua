-- LSP configuration
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup()
        require('mason-lspconfig').setup{
            ensure_installed = {
                'lua_ls',
                'gopls',
                'golangci_lint_ls',
            },
            automatic_instalation = true,
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup{
                        settings = {
                            Lua = {
                                diagnostics = { globals = { 'vim' } }
                            }
                        }
                    }
                end,
            },
        }
    end
}


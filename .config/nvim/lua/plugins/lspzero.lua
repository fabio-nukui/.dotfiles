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
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_zero.buffer_autoformat()
        end)

        require('mason').setup()

        local lspconfig = require('lspconfig')
        local lua_ls_config = {
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } }
                }
            }
        }
        local gopls_config = {
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                }
            }
        }
        require('mason-lspconfig').setup {
            ensure_installed = {
                'lua_ls',
                'gopls',
            },
            automatic_instalation = true,
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    lspconfig.lua_ls.setup(lua_ls_config)
                end,
                gopls = function()
                    lspconfig.gopls.setup(gopls_config)
                end,
            },
        }
    end
}

require("config.keymaps")
require("config.options")
require("config.autocmds")

if not vim.g.vscode then
    require("config.lazy")
end

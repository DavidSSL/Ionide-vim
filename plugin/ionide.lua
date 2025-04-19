-- plugin/ionide.lua

-- Equivalent to: call fsharp#loadConfig()
vim.fn['fsharp#loadConfig']()

-- Equivalent to: let s:did_lsp_setup = 0
-- Note: Using a local variable in Lua. It won't persist across multiple sourcing
-- events like s:did_lsp_setup might, but for a startup script, this is usually fine.
-- If persistence were needed, you might use a global or a module variable.
local did_lsp_setup = false

-- Equivalent condition check:
-- if g:fsharp#backend == 'nvim' && g:fsharp#lsp_auto_setup && !s:did_lsp_setup
-- Note: Using vim.g to access global Vim variables.
-- Also checking == 1 explicitly, as Lua treats 0 as true, unlike Vimscript.
if vim.g['fsharp#backend'] == 'nvim' and vim.g['fsharp#lsp_auto_setup'] == 1 and not did_lsp_setup then
    did_lsp_setup = true
    -- Equivalent to: lua ionide.setup{}
    -- We explicitly require the module and call setup.
    -- Ensure the ionide module is in your runtime path (e.g., lua/ionide/init.lua)
    require('ionide').setup({})
end

-- The cpo handling isn't typically needed or directly translatable in the same way
-- for Lua scripts run via Neovim's plugin mechanism.

-- vim: sw=4 et sts=4
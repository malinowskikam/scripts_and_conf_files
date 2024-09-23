vim.api.nvim_create_autocmd('FileType', {
    pattern = 'go',
    callback = function(args)
        vim.lsp.start({
            name = 'gopls',
            cmd = {'gopls'},
            root_dir = vim.fs.root(args.buf, {'.git'}),
        })
    end,
})

vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, {desc = "LSP Rename symbol"})
vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, {desc = "LSP Code Action"})
vim.keymap.set('n', '<leader>gc', vim.lsp.buf.completion, {desc = "LSP Code Completion"})
vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, {desc = "LSP Hover"})
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {desc = "LSP Go To Definition"})
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {desc = "LSP Formatting"})


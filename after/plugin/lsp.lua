local has_lsp, lsp = pcall(require, "lsp-zero")

if not has_lsp then
  vim.notify("lsp-zero not found!")
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  "pyright",
  "sumneko_lua",
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      -- Fix Undefined global "vim".
      diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    }
  }
})


local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  vim.notify("cmp not found!")
  return
end

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  -- ('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  -- ('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  -- ('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  -- ('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  -- ('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  -- ('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  -- ('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  -- ('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  -- ('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- ('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  -- ('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  -- ('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  -- ('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  --
  -- ('<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  --   vim.lsp.buf.format()
  -- end, { desc = 'Format current buffer with LSP' })

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  -- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  -- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

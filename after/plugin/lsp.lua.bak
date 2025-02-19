local on_attach = function(client, bufnr)
  local has_keymaps, keymaps = pcall(require, "user.keymaps")

  if has_keymaps and keymaps.on_attach then
    keymaps.on_attach(client, bufnr)
  else
    vim.notify("user.keymaps not found!")
  end
end

local icons = {
  Error = "✘",
  Warn = "▲",
  Hint = "⚑",
  Info = "",
}

for name, icon in pairs(icons) do
  local fullname = "DiagnosticSign" .. name
  vim.fn.sign_define(fullname, {
    texthl = fullname,
    text = icon,
    numhl = "",
  })
end

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  -- lua_ls = {
  --   Lua = {
  --     -- Fix Undefined global "vim".
  --     diagnostics = { globals = { "vim" } },
  --     workspace = { checkThirdParty = false },
  --     telemetry = { enable = false },
  --   },
  -- },
}

local has_neodev, neodev = pcall(require, "neodev")
if has_neodev then
  neodev.setup()
else
  vim.notify("neodev not found!")
end

local has_mason, mason = pcall(require, "mason")
if has_mason then
  mason.setup()
else
  vim.notify("mason not found!")
end

local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not has_mason_lspconfig then
  vim.notify("mason-lspconfig not found!")
  return
end

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    })
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local M = {}


local function ends_with(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end


-- Select the first buffer with a number greater than given buffer
-- From: https://github.com/ojroques/nvim-bufdel
local function get_next_buf(buf)
  local next = vim.fn.bufnr('#')
  for i = 0, vim.fn.bufnr('$') - 1 do
    next = (buf + i) % vim.fn.bufnr('$') + 1  -- will loop back to 1
    if vim.fn.buflisted(next) == 1 then
      return next
    end
  end
end


function M.close_buffer()
  local buf_name = vim.fn.bufname('%')

  -- Don't delete the tree explorer.
  if buf_name == 'NvimTree' then
    require('nvim-tree').close()
    return
  end

  -- Close the Plugins window.
  if buf_name == '[Plugins]' then
    vim.cmd('wincmd c')
    return
  end

  -- Is this an anonymous buffer?
  if buf_name == '' then
    if vim.fn.winnr('$') == 1 then
      -- If this is the last window, then toggle the tree explorer.
      require'nvim-tree'.toggle(false)
    else
      -- Close this window.
      vim.cmd('wincmd c')
    end
    return
  end

  -- If we only have one buffer (or no buffers), then create a new empty one.
  local num_bufs = #vim.fn.getbufinfo({buflisted = 1})
  if num_bufs < 2 then
    vim.cmd('enew')
    vim.cmd('bp')
  end

  -- Get this buffer number and the next one.
  local buf = vim.fn.bufnr()
  local next_buf = get_next_buf(buf)

  -- Switch to the next buffer.
  vim.cmd(string.format('buffer %d', next_buf))

  -- For now, if this is a .git/index, then just leave it alone.
  if ends_with(buf_name, '.git/index') then
    return
  end

  -- If this buffer is no longer visible, then delete it.
  if #vim.fn.getbufinfo(buf)[1].windows == 0 then
    if vim.fn.buflisted(buf) then
      vim.cmd(string.format('bd! %d', buf))
    end
  end
end


function M.toggle_buffers()
  local buf_name = vim.fn.bufname('#')
  if buf_name == 'NvimTree' then
    require'nvim-tree'.open()
  else
    vim.cmd(vim.api.nvim_replace_termcodes('normal <C-^>', true, true, true))
  end
end


return M

local using_winterm = os.getenv("USING_WINTERM") ~= nil

-- If we're not using Windows Terminal, then skip configuring OSC52.
if using_winterm then
  return
end

local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

-- Set the '+' register to copy to system clipboard using OSC52.
vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}

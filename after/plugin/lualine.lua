local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
  vim.notify("lualine not found!")
  return
end

-- Show "recording" status.
local has_noice, noice = pcall(require, "noice")
local recording = {}

if has_noice then
  local function has_recording_message()
    if not noice.api.status.mode.has() then
      return false
    end

    local message = noice.api.status.mode.get()
    return message ~= nil and message:sub(1, 3) ~= '-- '
  end

  recording = {
    noice.api.status.mode.get,
    cond = has_recording_message,
    color = { fg = "#ff9e64" },
  }
end


-- Show git blame.
local has_gitblame, gitblame = pcall(require, "gitblame")
local blame = {}
if has_gitblame then
  blame = {
    gitblame.get_current_blame_text,
    cond = gitblame.is_blame_text_available,
  }
end


local fullpath = {
  "filename",
  path = 1,
  file_status = false,
  shorting_target = 0,
}

local filename = {
  "filename",
  path = 0,
  file_status = false,
  shorting_target = 0,
  separator = {left = '', right = ''},
}

local filetype = {'filetype', icon_only = true}


lualine.setup({
  options = {
    theme = 'auto',
    globalstatus = true,
  },
  extensions = {'neo-tree', 'quickfix', 'toggleterm'},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {fullpath},
    lualine_x = {blame, recording},
    lualine_y = {filetype, 'searchcount'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {fullpath},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  winbar = {
    lualine_a = {},
    lualine_b = {filename},
    lualine_c = {},
    lualine_x = {'branch'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {fullpath},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
})

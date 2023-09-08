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
    return (
      noice.api.status.mode.has() and
      noice.api.status.mode.get() ~= "-- INSERT --"
    )
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
  blame = { gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available }
end


lualine.setup({
  options = {
    theme = "auto",
  },
  sections = {
    lualine_c = { {
      "filename",
      path = 1,
      show_modified_status = false,
    } },
    lualine_x = { blame, recording },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
})

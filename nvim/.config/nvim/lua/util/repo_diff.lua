-- ai generated repo diff component for lualine

local M = {}

local cache = nil -- nil hides the component (e.g. not in a git repo)
local running = false

-- Count hunks the way gitsigns does: added / modified / removed lines
local function parse(stdout)
  local r = { added = 0, modified = 0, removed = 0 }
  for line in stdout:gmatch("[^\n]+") do
    local old, new = line:match("^@@ %-%d+,?(%d*) %+%d+,?(%d*) @@")
    if old then
      old = old == "" and 1 or tonumber(old)
      new = new == "" and 1 or tonumber(new)
      if old == 0 then
        r.added = r.added + new
      elseif new == 0 then
        r.removed = r.removed + old
      else
        local mod = math.min(old, new)
        r.modified = r.modified + mod
        r.added = r.added + math.max(0, new - old)
        r.removed = r.removed + math.max(0, old - new)
      end
    end
  end
  return r
end

function M.update()
  if running then return end
  running = true
  vim.system(
    { "git", "diff", "-U0", "--no-color", "--no-ext-diff", "HEAD" },
    { text = true, cwd = vim.fn.getcwd() },
    function(res)
      running = false
      cache = (res.code == 0) and parse(res.stdout or "") or nil
      vim.schedule(function()
        local ok, lualine = pcall(require, "lualine")
        if ok then lualine.refresh() end
      end)
    end
  )
end

-- This is what you pass to lualine
function M.source()
  return cache
end

function M.setup()
  local group = vim.api.nvim_create_augroup("RepoDiff", { clear = true })
  vim.api.nvim_create_autocmd(
    { "VimEnter", "BufWritePost", "FocusGained", "DirChanged", "ShellCmdPost", "TermClose" },
    { group = group, callback = M.update }
  )
  -- Catch external changes (git commands in a terminal, other tools, etc.)
  local timer = vim.uv.new_timer()
  timer:start(5000, 5000, vim.schedule_wrap(M.update))
end

return M
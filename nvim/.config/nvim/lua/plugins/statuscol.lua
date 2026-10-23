return {
  'luukvbaal/statuscol.nvim',
  config = function()
    local function line_number(args)
      local nu = vim.wo[args.win].number
      local rnu = vim.wo[args.win].relativenumber
      if not nu and not rnu then
        return ""
      end

      -- width follows the line count, so it grows from 99 -> 100 lines
      local width = #tostring(vim.api.nvim_buf_line_count(args.buf))

      -- wrapped lines / virtual lines: blank, but keep the width so text stays aligned
      if args.virtnum ~= 0 then
        return string.rep(" ", width)
      end

      local n
      if rnu and nu and args.relnum == 0 then
        n = args.lnum -- hybrid: current line shows the absolute number
      elseif rnu then
        n = args.relnum -- relative (current line shows 0 if number is off)
      else
        n = args.lnum -- absolute
      end

      return string.format(" " .. "%" .. width .. "d", n)
    end

    require('statuscol').setup({
      -- configuration goes here, for example:
      relculright = true,
      ft_ignore = { "neo-tree" },
      segments = {
        -- Column 1: gitsigns
        {
          sign = {
            namespace = { "gitsigns.*" },
            maxwidth = 1,
            colwidth = 2,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        -- Column 2: diagnostics
        {
          sign = {
            namespace = { ".*" },
            maxwidth = 1,
            colwidth = 2,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        -- Line numbers (same as the default gutter), followed by a space
        {
          text = { line_number, " " },
          click = "v:lua.ScLa",
        },
      },
    })
  end,
}

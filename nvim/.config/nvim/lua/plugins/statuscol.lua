return {
  "luukvbaal/statuscol.nvim",
  enabled = true,
  config = function()
    local builtin = require("statuscol.builtin")

    vim.o.foldenable = true
    vim.o.foldcolumn = "1" -- statuscol needs this nonzero to show fold info
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99

    vim.opt.fillchars:append({
      foldopen = "",
      foldclose = "",
      fold = " ",
      foldsep = " ",
    })

    local function line_number(args)
      local nu = vim.wo[args.win].number
      local rnu = vim.wo[args.win].relativenumber
      if not nu and not rnu then
        return ""
      end

      -- width follows the line count with a min of 3, so it grows from 99 -> 100 lines
      local width = math.max(3, #tostring(vim.api.nvim_buf_line_count(args.buf)))

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

    require("statuscol").setup({
      relculright = true,
      ft_ignore = { "neo-tree", "snacks_dashboard", },
      segments = {
        {
          sign = {
            namespace = { "gitsigns.*" },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        {
          sign = {
            namespace = { "diagnostic" },
            name = { "todo%-sign" },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
          },
          click = "v:lua.ScSa",
        },
        -- {
        --   sign = {
        --     name = { ".*" },
        --     maxwidth = 1,
        --     colwidth = 2,
        --     auto = true,
        --   },
        --   click = "v:lua.ScSa",
        -- },
        -- {
        --   sign = {
        --     namespace = { ".*" },
        --     maxwidth = 1,
        --     colwidth = 2,
        --     auto = true,
        --   },
        --   click = "v:lua.ScSa",
        -- },
        {
          text = { line_number, "" },
          click = "v:lua.ScLa",
        },
        {
          text = { builtin.foldfunc, " " },
          click = "v:lua.ScFa",
        },
      },
    })
  end,
}

return {
  { 'tpope/vim-surround' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup {}

      -- configure with nvim-cmp
      local cmp_status_ok, cmp = pcall(require, 'cmp')
      if cmp_status_ok then
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )
      end

      -- completion rules
      local Rule = require('nvim-autopairs.rule')
      -- local cond = require('nvim-autopairs.conds')

      npairs.add_rules({
        -- multi-line commenting in c, c++, java
        Rule("/*", "*/", {"c", "cc", "cpp", "cp", "java"}),
        -- tex/latex
        Rule("$", "$", {"tex", "latex"})
          :with_move(function(opts)
            return opts.next_char == opts.char
          end),
        Rule("\\left(", "\\right)", {"tex", "latex"}),
        Rule("\\[", "\\]", {"tex", "latex"}),
        Rule("\\left[", "\\right]", {"tex", "latex"}),
        Rule("\\{", "\\}", {"tex", "latex"}),
        Rule("\\left\\{", "\\right\\}", {"tex", "latex"})
      })
    end
  },
}

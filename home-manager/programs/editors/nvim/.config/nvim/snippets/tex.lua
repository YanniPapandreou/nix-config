local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Latex Snippets", { clear = true })
local file_pattern = "*.tex"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

-- Delimiters --

-- Environments --

cs( -- latex beginend environment snippet
  "env",
  fmt(
    [[
  \begin{{{}}}
    {}
  \end{{{}}}
    ]], {
      i(1, ""),
      i(2, ""),
      rep(1),
    }
  )
)

cs( -- latex beginend regex env snippet
  { trig = "begin([%w_]+)", regTrig = true, hidden = true },
  fmt(
    [[
  \begin{{{}}}
    {}
  \end{{{}}}
    ]], {
      d(1, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
      end),
      i(2, ""),
      rep(1),
    }
  )
)

cs( -- latex equation(*) env snippet
  "eqn",
  fmt(
    [[
  \begin{{{}}}
    {}
  \end{{{}}}
    ]], {
      c(1, {t"equation", t"equation*"}),
      i(2, ""),
      rep(1),
    }
  )
)

cs( -- latex align(*) env snippet
  "align",
  fmt(
    [[
  \begin{{{}}}
    {}
  \end{{{}}}
    ]], {
      c(1, {t"align", t"align*"}),
      i(2, ""),
      rep(1),
    }
  )
)


-- Fonts --

cs( -- latex snippet to wrap selection into italics (\textit)
  "set_italics",
  fmt(
    [[
  \textit{{{}}}
    ]], {
      f(function(_, snip)
        -- TODO: make this work for multiline text
        return snip.env.TM_SELECTED_TEXT[1]
      end)
    }
  )
)

cs( -- latex snippet to wrap selection into italics (\textit)
  "set_bold",
  fmt(
    [[
  \textbf{{{}}}
    ]], {
      f(function(_, snip)
        -- TODO: make this work for multiline text
        return snip.env.TM_SELECTED_TEXT[1]
      end)
    }
  )
)

-- Math -- 
cs( -- latex \frac snippet
  "frac",
  fmt(
    [[
  \frac{{{}}}{{{}}}
    ]], { 
      i(1, ""),
      i(2, ""),
    }
  )
)

-- Miscellaneous --
cs( -- latex hyperlink snippet
  "hyperlink",
  fmt(
    [[
  \href{{{}}}{{{}}}
    ]], {
      i(1, "url"),
      i(2, "display name"),
    }
  )
)

-- End Refactoring --

return snippets, autosnippets

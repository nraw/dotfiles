local ls = require("luasnip")

ls.snippets = {
	mysnippet = ls.parser.parse_snippet({
		trig = "mytrigger",
		desc = "My snippet description",
		-- The body of the snippet goes here
		"local x = ${1:1}",
		"local y = ${2:2}",
		"$0",
	}),
}

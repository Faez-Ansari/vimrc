local fzf_lua = require("fzf-lua")

local gen_mru_opts = function(args)
	local opts = {
		previewer = "builtin",
		actions = fzf_lua.defaults.actions.files,
		file_icons = true,
		color_icons = true,
	}
	for k, v in pairs(args) do
		opts[k] = v
	end

	opts.fn_transform = function(x)
		return fzf_lua.make_entry.file(x, opts)
	end
	return opts
end

fzf_lua.mru = function(args)
	args.prompt = "MRU> "
	local cmd = 'git ls-files --full-name -z | xargs -0 -I{} -- stat -c"%Y %n" "{}" | sort -k1,1nr | cut -d" " -f2-'
	local opts = gen_mru_opts(args)
	fzf_lua.fzf_exec(cmd, opts)
end

local fzf_lua = require("fzf-lua")
local mru_cache = require("mru_cache")

local gen_mru_cmd = function(type)
	-- remove current file and cwd
	return "sed -e '\\|^"
		.. vim.api.nvim_buf_get_name(0)
		.. "$|d' -e 's|^"
		.. vim.fn.getcwd()
		.. "/||' "
		.. mru_cache.cache_path(type)
end
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
	local cmd = gen_mru_cmd("mru")
	local opts = gen_mru_opts(args)
	fzf_lua.fzf_exec(cmd, opts)
end

fzf_lua.mrw = function(args)
	args.prompt = "MRW> "
	local cmd = gen_mru_cmd("mrw")
	local opts = gen_mru_opts(args)
	fzf_lua.fzf_exec(cmd, opts)
end

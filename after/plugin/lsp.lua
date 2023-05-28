local capabilities = require("cmp_nvim_lsp").default_capabilities()

local key = vim.keymap

local opts = { noremap = true, silent = true }
key.set("n", "[d", vim.diagnostic.goto_prev, opts)
key.set("n", "]d", vim.diagnostic.goto_next, opts)

vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })]])

function HoverFixed()
	vim.api.nvim_command("set eventignore=CursorHold")
	vim.lsp.buf.hover()
	vim.api.nvim_command('autocmd CursorMoved <buffer> ++once set eventignore=""')
end

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	key.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	key.set("n", "gd", vim.lsp.buf.definition, bufopts)
	key.set("n", "K", HoverFixed, bufopts)
	key.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	key.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	key.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	key.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	key.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	key.set("n", "<f2>", vim.lsp.buf.rename, bufopts)
	key.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	key.set("n", "gr", vim.lsp.buf.references, bufopts)
end

vim.lsp.protocol.CompletionItemKind = {
	"   (Text) ",
	"   (Method)",
	"   (Function)",
	"   (Constructor)",
	" ﴲ  (Field)",
	"[] (Variable)",
	"   (Class)",
	" ﰮ  (Interface)",
	"   (Module)",
	" 襁 (Property)",
	"   (Unit)",
	"   (Value)",
	" 練 (Enum)",
	"   (Keyword)",
	"   (Snippet)",
	"   (Color)",
	"   (File)",
	"   (Reference)",
	"   (Folder)",
	"   (EnumMember)",
	" ﲀ  (Constant)",
	" ﳤ  (Struct)",
	"   (Event)",
	"   (Operator)",
	"   (TypeParameter)",
}

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

local lspconfig = require("lspconfig")

lspconfig.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

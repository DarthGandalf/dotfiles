-- gentoo syntax and airline
vim.opt.rtp:append('/usr/share/vim/vimfiles')

vim.cmd([[
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'navarasu/onedark.nvim'
Plug 'mhinz/vim-signify'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'posva/vim-vue'
Plug 'nvim-lua/plenary.nvim'
Plug 'joechrisellis/lsp-format-modifications.nvim'
"Plug 'rhysd/vim-clang-format'
"let g:clang_format#auto_formatexpr = 1
Plug 'lervag/vimtex'
call plug#end()
]])

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

require('onedark').setup {
	transparent = true,
	highlights = {
		["Comment"] = {fg = "#2ac0c9"},
	}
}
require('onedark').load()

vim.opt.visualbell = true
vim.opt.linebreak = true
vim.opt.fileencodings = 'ucs-bom,utf-8,cp1251'
vim.opt.colorcolumn = '+1'
vim.opt.foldcolumn = 'auto'
vim.opt.whichwrap:append('<,>,[,]')
vim.opt.scrolloff = 5

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = { tab = '▸ ' }

vim.g.airline_powerline_fonts = true
vim.g.airline_theme = 'onedark'

-- coc (LSP)
local function cockeys()
	function _G.coc_my_check_back_space()
		local col = vim.fn.col('.') - 1
		return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
	end
	local keyset = vim.keymap.set
	local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
	-- Use Tab for trigger completion with characters ahead and navigate
	keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.coc_my_check_back_space() ? "<TAB>" : coc#refresh()', opts)
	keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
	-- Make <CR> to accept selected completion item or notify coc.nvim to format
	-- <C-g>u breaks current undo, please make your own choice
	keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
	-- Use <c-space> to trigger completion
	keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
	-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
	vim.api.nvim_create_augroup("CocGroup", {})
	vim.api.nvim_create_autocmd("CursorHold", {
		group = "CocGroup",
		command = "silent call CocActionAsync('highlight')",
		desc = "Highlight symbol under cursor on CursorHold"
	})
	-- autoformat
	vim.api.nvim_create_autocmd("FileType", {
		group = "CocGroup",
		--pattern = "json,rust,python,javascript,typescript",
		command = "setl formatexpr=CocAction('formatSelected')",
		desc = "Setup formatexpr specified filetype(s)."
	})
end
cockeys()

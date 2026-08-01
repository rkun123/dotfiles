" Indents
set number
set shiftwidth=2
set tabstop=4
set autoindent
set smartindent
filetype plugin indent on

set clipboard+=unnamedplus

syntax enable

colorscheme default

" Mappings
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Buffers
noremap <C-S-h> :bprev<CR>
noremap <C-S-l> :bnext<CR>
" Term
tnoremap <Esc> <C-\><C-n>


" Plugins
"
" 1. lazy.nvim 本体がなければ自動でダウンロードする設定
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
          "clone",
              "--filter=blob:none",
                  "https://github.com/folke/lazy.nvim.git",
                      "--branch=stable", -- 最新の安定版を使用
                          lazypath,
                            })
                            end
                            vim.opt.rtp:prepend(lazypath)

EOF

" lazy.nvim のプラグイン群に fzf と fzf.vim を追加して設定する

lua << EOF
require("lazy").setup({
  -- もしすでに他にプラグインが並んでいる場合は、その並び（{} の中）に以下を追加してください
  {
    "junegunn/fzf",
    build = "./install --all",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      -- キーマップの設定 (Ctrl + p でファイル検索)
      vim.keymap.set("n", "<C-p>", function()
        if vim.fn.isdirectory(".git") == 1 then
          vim.cmd("GFiles")
        else
          vim.cmd("Files")
        end
      end, { desc = "Fzf Files" })
    end,
  },
 	-- === ここからLSPの設定を追加 ===
  {
	"mason-org/mason.nvim",
	opts = {},
  },

  {
	"mason-org/mason-lspconfig.nvim",
	opts = {
	  ensure_installed = {
		"lua_ls",
		-- "gopls",
		-- "ts_ls",
		-- "pyright",
		-- 必要になったら追加
	  },
	},
  },

  {
	"neovim/nvim-lspconfig",
	dependencies = {
	  "mason-org/mason.nvim",
	  "mason-org/mason-lspconfig.nvim",
	  "saghen/blink.cmp",
	},
	config = function()
	  local capabilities = require("blink.cmp").get_lsp_capabilities()

	  vim.lsp.config("*", {
		capabilities = capabilities,
	  })

	  vim.lsp.enable("lua_ls")

	  vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
		  local opts = { buffer = args.buf }

		  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end,
	  })
	end,
  },

  {
	"saghen/blink.cmp",
	version = "*",
	opts = {
	  keymap = {
		preset = "default",
	  },
	  appearance = {
		nerd_font_variant = "mono",
	  },
	  completion = {
		documentation = {
		  auto_show = true,
		},
	  },
	  sources = {
		default = { "lsp", "path", "buffer" },
	  },
	},
  },

})
EOF

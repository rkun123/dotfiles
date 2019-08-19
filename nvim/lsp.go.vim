if executable('gopls')
  au User lsp_setup call lsp#register_server({
	\ 'name': 'gopls',
	\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
	\ 'whitelist': ['go'],
	\ })
  autocmd BufWritePre *.go LspDocumentFormatSync
endif

if executable('go-langserver')
  au User lsp_setup call lsp#register_server({
	\ 'name': 'go-langserver',
	\ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
	\ 'whitelist': ['go'],
	\ })
  autocmd BufWritePre *.go LspDocumentFormatSync
endif

if executable('bingo')
  au User lsp_setup call lsp#register_server({
	\ 'name': 'bingo',
	\ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
	\ 'whitelist': ['go'],
	\ })
endif

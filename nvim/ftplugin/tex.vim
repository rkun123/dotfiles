augroup texautocompile
  autocmd!
  au BufWritePost :!platex expand("%:p")
augroup end

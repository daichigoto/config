" users generic .vimrc file for vim(1)
"
" Copyright (c) 2001-2020 Daichi GOTO <daichi@ongs.co.jp>
" Copyright (c) 2006,2009-2012,2015,2019 ONGS Inc. <info@ongs.co.jp>
" Copyright (c) 2010 Hiroaki TOMIDA <7gou@kiku33.com>
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
"
" 1. Redistributions of source code must retain the above copyright
"    notice, this list of conditions and the following disclaimer.
" 2. Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in the
"    documentation and/or other materials provided with the distribution.
"
" THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
" PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
" BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
" INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
" IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
" ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
" THE POSSIBILITY OF SUCH DAMAGE.

" author: Daichi GOTO (daichi@ongs.co.jp), Hiroaki TOMIDA (7gou@kiku33.com)
" first edition: Fri May 17 12:31:53 JST 2002

" evim.vim will already have done these configuration.
if v:progname == "evim"
  finish
endif

" ----------------------------------------------------------------------
" Dein plug-ins management
" ----------------------------------------------------------------------
if &compatible
	set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein/')

	" Let dein manage dein
	" Required:
	call dein#add('Shougo/dein.vim')

	" Add or remove your plugins here
	call dein#add('junegunn/seoul256.vim')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('preservim/nerdtree')
	"call dein#add('Shougo/denite.nvim')
	"call dein#add('roxma/nvim-yarp') " required by denite.vim
	"call dein#add('roxma/vim-hug-neovim-rpc') " required by denite.vim

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" seoul256
let g:seoul256_background = 233
colo seoul256

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'
let g:airline_theme = 'tomorrow'
let g:airline_theme = 'molokai'

" NERDTree
"  <C-o> open NERDTree
nnoremap <silent> <C-o> :NERDTreeToggle<CR>

" denite
"  <C-o> open Denite-file-buffer-list
"    <Esc>	close Denite-file-buffer-list
"    <Space>	select multiple files/buffers
"    <CR>	open files/buffers
"    o		open files/buffers
"    s		open files/buffers in split windows (horizonal)
"    v		open files/buffers in split windows (vertical)
"    i		filter by string
"    ..		move to directory above
"nnoremap <silent> <C-o> :<C-u>Denite file buffer file:new<CR>
"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
"	nnoremap <silent><buffer><expr> <Esc>
"		\ denite#do_map('quit')
"	nnoremap <silent><buffer><expr> <Space>
"		\ denite#do_map('toggle_select').'j'
"	nnoremap <silent><buffer><expr> <CR>
"		\ denite#do_map('do_action')
"	nnoremap <silent><buffer><expr> o
"		\ denite#do_map('do_action')
"	nnoremap <silent><buffer><expr> s
"		\ denite#do_map('do_action', 'split')
"	nnoremap <silent><buffer><expr> v
"		\ denite#do_map('do_action', 'vsplit')
"	nnoremap <silent><buffer><expr> i
"		\ denite#do_map('open_filter_buffer')
"	nnoremap <silent><buffer><expr> ..
"		\ denite#do_map('move_up_path')
"endfunction

" ----------------------------------------------------------------------
" How to install Dein:
" 	mkdir -p ~/.cache/dein
" 	cd ~/.cache/dein/
" 	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" 	sh ./installer.sh .
"	rm ./installer.sh
" ----------------------------------------------------------------------

" allow [Backspace] over insert mode to remove charactors
"  start - allow all charactors to remove
"  eol - allow to remove eol and join lines
"  indent - allow to remove indent in autoindent mode
set backspace=start,eol,indent

" allow some keys to move the cursor left/right to move to 
" the previous/next line when the cursor is on the first/last
" character in the line.
"  b - [Backspace]  normal visual 
"  s - [Space]      normal visual
"  < - [Left]       normal visual
"  > - [Right]      normal visual
"  [ - [Left]       insert replace
"  ] - [Right]      insert replace
"  ~ - ~            normal
set whichwrap=b,s,[,],<,>,~,h,l

" mouse feature off
set mouse=

" syntax highlight on
syntax on
set nohlsearch " non-highlight for search keyword
set cursorline " use cursorline indicator

" line numbers on
set number

" status line on
set laststatus=2 " always displaying status line
set statusline=%F%r%h%= " statusline format

" incremental search and not case-sensitive on
set incsearch
set ignorecase

" use extended menu complementation feature
set wildmenu wildmode=list:full

" use decimal instead of octal
set nrformats=

" set tab indent depth
autocmd Filetype xml set tabstop=1 shiftwidth=1 softtabstop=1
autocmd Filetype html set tabstop=1 shiftwidth=1 softtabstop=1

" displayed line movement gj/gk as default instead of j/k
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" for useful argdo mutli-files replaces
set hidden

" autoload configurations files
set runtimepath+=~/.vim/
runtime! userautoload/*.vim

" load user .vimrc configuration file
if filereadable(expand('~/.vimrc.mine'))
  source ~/.vimrc.mine
endif

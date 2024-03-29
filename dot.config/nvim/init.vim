" users generic init.vim file for nvim(1)
"
" Copyright (c) 2001-2004,2020,2021,2023 Daichi GOTO <daichi@ongs.co.jp>
" Copyright (c) 2006,2009-2012,2015,2016 ONGS Inc. <info@ongs.co.jp>
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
"
if &compatible
	set nocompatible
endif
" ----------------------------------------------------------------------
" Dein plug-ins management system installation
" ----------------------------------------------------------------------
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
	call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
	let s:dein_dir = fnamemodify('dein.vim', ':p')
	if !isdirectory(s:dein_dir)
		let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
		if !isdirectory(s:dein_dir)
			execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
		endif
	endif
	execute 'set runtimepath^=' .. substitute(
				\ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" ----------------------------------------------------------------------
" Dein plug-ins management system setup
" ----------------------------------------------------------------------
" Required:
set runtimepath+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/nvim/dein/')
	call dein#begin('~/.cache/nvim/dein/')

	" Let dein manage dein
	" Required:
	call dein#add('Shougo/dein.vim')

	" Add or remove your plugins here
	call dein#add('junegunn/seoul256.vim')
	call dein#add('fholgado/minibufexpl.vim')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	"call dein#add('junegunn/fzf', {'build': './install --all'})
	"call dein#add('junegunn/fzf.vim')
	call dein#add('sheerun/vim-polyglot')
	call dein#add('dense-analysis/ale')
	call dein#add('tpope/vim-commentary')
	call dein#add('junegunn/vim-easy-align')
	"call dein#add('preservim/nerdtree')
	"call dein#add('Shougo/denite.nvim')
	"call dein#add('tpope/vim-fugitive')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" ----------------------------------------------------------------------
" Settings for each plugin
" ----------------------------------------------------------------------
" seoul256
let g:seoul256_background = 233
colo seoul256

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" minibufexpl
"  bn		move to next buffer
"  b1		move to buffer 1
"  b2		move to buffer 2
"  b3		move to buffer 3
"  b4		move to buffer 4
"  b5		move to buffer 5
"  b6		move to buffer 6
"  b7		move to buffer 7
"  b8		move to buffer 8
"  b9		move to buffer 9
nnoremap <silent> <C-t> :bnext<CR>
"nnoremap <silent> bn :bnext<CR>
"nnoremap <silent> b1 :b1<CR>
"nnoremap <silent> b2 :b2<CR>
"nnoremap <silent> b3 :b3<CR>
"nnoremap <silent> b4 :b4<CR>
"nnoremap <silent> b5 :b5<CR>
"nnoremap <silent> b6 :b6<CR>
"nnoremap <silent> b7 :b7<CR>
"nnoremap <silent> b8 :b8<CR>
"nnoremap <silent> b9 :b9<CR>
let g:miniBufExplorerMoreThanOne = 0 "always show MiniBufExplorer

" fzf
"  <C-o>	list files and directories
"  fzf		list files and directories of parent directory
"  bu		list buffers
"nnoremap <silent> <C-o> :Files<CR>
"nnoremap <silent> fzf :Files ..<CR>
"nnoremap <silent> bu :Buffers<CR>

" vim-easy-align
"  ga		start interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" NERDTree
"  <C-o> open NERDTree
"    <C-o>	close NERDTree
"    <CR>	open file and close NERDTree
"nnoremap <silent> <C-o> :NERDTreeToggle<CR>
"let g:NERDTreeQuitOnOpen = 1

" denite
"  <C-b> open Denite-buffer-list
"    <Esc>	close Denite-buffer-list
"    <Space>	select multiple buffers
"    <CR>	open buffers
"    o		open buffers
"    s		open buffers in split windows (horizonal)
"    v		open buffers in split windows (vertical)
"    i		filter by string
"    ..		move to directory above
"
" If you use Denite, execute the following command:
" 	pip install --user pynvim
"
"nnoremap <silent> <C-b> :<C-u>Denite buffer file:new<CR>
"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
"	nnoremap <silent><buffer><expr> <C-b>
"		\ denite#do_map('quit')
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
"
" If you use Denite, execute the following command:
" 	pip install --user pynvim
"
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
" Other settings
" ----------------------------------------------------------------------
" disable mouse feature
set mouse=

" non-highlight for search keyword
set nohlsearch

" use cursorline indicator
set cursorline

" enable line numbers
set number

" enable incremental search and not case-sensitive
set ignorecase

" use extended menu complementation feature
set wildmenu wildmode=list:full

" use decimal instead of octal
set nrformats=

" for useful argdo mutli-files replaces
set hidden

" set tab length
set tabstop=8

" laod some customized files
let customvims = ""
if filereadable(expand('~/.config/nvim/init.vim'))
	let customvims = globpath(expand('~/.config/nvim'), "*.vim")
endif
if filereadable(expand('~/AppData/Local/nvim/init.vim'))
	let customvims = globpath(expand('~/AppData/Local/nvim'), "*.vim")
endif
while strlen(customvims) > 0
	let i = stridx(customvims, "\n")
	if i < 0
		let f = customvims
		let customvims = ""
	else
		let f = strpart(customvims, 0, i)
		let customvims = strpart(customvims, i+1, 9999)
	endif
	if filereadable(f) && -1 == stridx(f, "init.vim")
		exe 'source ' . f
	endif
	unlet f
	unlet i
endwhile
unlet customvims

" load user .nvimrc configuration file
if filereadable(expand('~/.nvimrc'))
	source ~/.nvimrc
endif

" Copyright (c) 2020,2021 Daichi GOTO <daichi@ongs.co.jp>
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

" author: Daichi GOTO (daichi@ongs.co.jp)
" first edition: Mon Jul  6 12:50:17 JST 2020

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

" displayed line movement gj/gk as default instead of j/k
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" set the left side of the w key (q on US keyboard) to move in the opposite 
" direction of w
nnoremap q b

" tab jump
nnoremap <Tab> 15<Right>
nnoremap <S-Tab> 15<Left>

" C-a	Move to the beginning of the line
" C-e	Move to the end of line
nnoremap <C-a> <Home>
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
vnoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <C-e> <End>
cnoremap <C-e> <End>
vnoremap <C-e> <End>

" ><	Move to the next empty element
" <>	Move to the pre empty element (Opposite direction of ><)
" ""	Move to the next empty double quotation
" ''	Move to the next empty single quotation
" ::	Move to the pre empty double quotation (Opposite direction of "")
" ;;	Move to the pre empty single quotation (Opposite direction of '')
nnoremap >< /<\([^>/]\+\)><\/\1><CR>/<<CR>
nnoremap <> ?<<CR>h?<\([^>/]\+\)><\/\1><CR>/<<CR>
nnoremap "" /""<CR>l
nnoremap '' /''<CR>l
nnoremap :: hh?""<CR>l
nnoremap ;; hh?''<CR>l

" Move cursor to center of line, scroll line to center of screen
function MoveCurtorToCenterOfScreen()
  let lwinheight = winheight('.')
  let lwinwidth = winwidth('.')
  let lhalfwidth = lwinwidth / 2
  let lwincol = wincol()

  " scroll line to center of screen
  execute("normal zz")

  " scroll line to the top quarter of the screen
  let offset = lwinheight / 4
  let index = 0
  while index < offset
    execute("normal ")
    let index = index + 1
  endwhile

  if lwincol > lhalfwidth
    let offset = lwincol - lhalfwidth
    let index = 0
    " move cursor to center of line
    while index < offset
      execute("normal zl")
      let index = index + 1
    endwhile
  elseif lwincol < lhalfwidth
    let offset = lhalfwidth - lwincol
    let index = 0
    " move cursor to center of line
    while index < offset
      execute("normal zh")
      let index = index + 1
    endwhile
  endif
endfunction

" cc	Move cursor to center of line, scroll line to center of screen
nnoremap cc :call MoveCurtorToCenterOfScreen()<CR>

" XXX experimental configurations
nnoremap FF <C-f>	" PageDown
nnoremap BB <C-b>	" PageUp
nnoremap DD <C-d>	" Half/PageDown
nnoremap UU <C-u>	" Half/PageUp

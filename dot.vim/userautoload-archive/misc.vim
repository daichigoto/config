" Copyright (c) 2010 ONGS Inc. <info@ongs.co.jp>
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
" first edition: Mon Feb 15 14:10:12 JST 2010
" last modified: $Date$
" version: $Revision$


" expand entering-tab to spaces
"set expandtab tabstop=8

" change tabs spaces
"nmap <silent> t]] :let &tabstop += 1<CR>
"nmap <silent> t[[ :let &tabstop -= &tabstop > 1 ? 1 : 0<CR>

" display commonly invisible chars and indicators on
"set list listchars=ta<SID>˯\ ,eol:⟀,trail:˯,extend<SID>\
"set list listchars=ta<SID>˯\ ,eol:‹,trail:˯,extend<SID>\
"set list listchars=ta<SID>˯\ ,eol:«,trail:˯,extend<SID>\
"set list listchars=ta<SID>_\ ,eol:$,trail:_,extend<SID>\

" status line on
"set laststatus=2 " always displaying status line
"set statusline=%F%m%r%h%w%=(%{&fenc}:%{&ff}) " statusline format

" ===========================================================================
" My vim configuration that aligns with the behaviors of IceNvim
"
" Only the features that do not require plugins are implemented.
"
" This configuration serves for the purpose of providing a minimal usable vim
" for scenarios such as a remote server where resources are limited and where
" you probably just want to quickly start editing.
" 
" For this same reason, when running the installation script of the dotfiles,
" this module is not automatically stowed.
"
" For ultimate editing experience, consider using neovim and IceNvim:
" https://github.com/Shaobin-Jiang/IceNvim
" ===========================================================================

" --- Basic Settings ---
set encoding=UTF-8
set fileencoding=utf-8

set number
set relativenumber
set cursorline
set colorcolumn=80

set tabstop=4
set shiftwidth=0
set expandtab
set shiftround

set ignorecase
set smartcase
set nohlsearch

set cmdheight=1
set cmdwinheight=1

colorscheme desert

set autoread

set whichwrap=<,>,[,]

set hidden

set nobackup
set nowritebackup
set noswapfile

set splitbelow
set splitright
set termguicolors
set shortmess=ltToOCFs

set showtabline=2

function! BufferTabLine()
  let l:parts = []
  for l:buf in getbufinfo({'buflisted': 1})
    let l:bn = l:buf.bufnr
    let l:name = empty(l:buf.name) ? '[No Name]' : fnamemodify(l:buf.name, ':t')
    let l:mod = l:buf.changed ? '·' : ''
    if l:bn == bufnr('%')
      let l:hl = '%#TabLineSel#'
    else
      let l:hl = '%#TabLine#'
    endif
    call add(l:parts, l:hl . ' ' . l:bn . ':' . l:name . l:mod . ' ')
  endfor

  let l:tab = join(l:parts, '')
  let l:tab .= '%#TabLineFill#'

  return l:tab
endfunction
set tabline=%!BufferTabLine()

set nrformats=bin,hex,alpha

set clipboard=unnamed,unnamedplus

" --- Keymaps ---
let mapleader = " "

nnoremap <C-s> :silent w<CR>
inoremap <C-s> <Esc>:silent w<CR>

nnoremap <F5> :silent source ~/.vimrc<CR>

nnoremap <C-z> :silent undo<CR>
inoremap <C-z> <Esc>:silent undo<CR>

nnoremap \ "_
vnoremap \ "_

noremap <C-g> <Cmd>mode<CR>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <A-f> <S-Right>
cnoremap <A-b> <S-Left>

nnoremap V 0v$

function! JoinLines()
  let l:v_count = v:count1 + 1

  if mode() ==# 'n'
    execute 'normal!' l:v_count . 'J'
  else
    execute 'normal!' 'J'
  endif
endfunction

nnoremap <silent> J <Cmd>call JoinLines()<CR>
vnoremap <silent> J <Cmd>call JoinLines()<CR>

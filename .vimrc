" Section: safety guard

if v:version < 700 | finish | endif

augroup vimrc
  autocmd!
augroup END

" Section: packages

let s:packlist = [
      \ ['wellle/targets.vim', {}],
      \ ['ronakg/quickr-preview.vim', { 'for': 'qf' }],
      \ ['bruhtus/bufstop', { 'branch': 'personal', 'on': '<Plug>(Bufstop-preview)' }],
      \ ['junegunn/fzf', { 'on':
      \  ['Files',
      \   'Rg',
      \   'Lines',
      \   'BLines']}],
      \ ['junegunn/fzf.vim', { 'on':
      \  ['Files',
      \   'Rg',
      \   'Lines',
      \   'BLines']}],
      \ ['tpope/vim-surround', { 'on':
      \   ['<Plug>Dsurround',
      \    '<Plug>Csurround',
      \    '<Plug>Ysurround',
      \    '<Plug>Yssurround',
      \    '<Plug>VSurround']}],
      \ ['tpope/vim-commentary', { 'on':
      \   ['<Plug>Commentary',
      \    '<Plug>CommentaryLine']}],
      \ ['tommcdo/vim-exchange', { 'on':
      \  ['<Plug>(Exchange)',
      \   '<Plug>(ExchangeLine)']}],
      \ ['jeetsukumaran/vim-indentwise', { 'on':
      \   ['<Plug>(IndentWisePreviousLesserIndent)',
      \    '<Plug>(IndentWisePreviousEqualIndent)',
      \    '<Plug>(IndentWisePreviousGreaterIndent)',
      \    '<Plug>(IndentWiseNextLesserIndent)',
      \    '<Plug>(IndentWiseNextEqualIndent)',
      \    '<Plug>(IndentWiseNextGreaterIndent)']}],
      \ ['bruhtus/vim-sneak', { 'branch': 'personal', 'on':
      \   ['<Plug>SneakLabel_s',
      \    '<Plug>SneakLabel_S']}],
      \ ]

try
  call plug#begin('~/.vim/packed')
  let g:plug_window = 'topleft new'

  for [pack, option] in s:packlist
    Plug pack, option
  endfor

  call plug#end()

catch /^Vim\%((\a\+)\)\=:E117/
  function! s:pack_init()
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent! exe '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

      call plug#begin('~/.vim/packed')
      let g:plug_window = 'topleft new'

      for [pack, option] in s:packlist
        Plug pack, option
      endfor

      call plug#end()
    endif
  endfunction

  command! PlugOn call s:pack_init() | PlugInstall
endtry

" Section: colorscheme

try
  colo seoul256mod
  if $TERM !=# 'linux' && has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
catch /^Vim\%((\a\+)\)\=:E185/
  function! s:colorscheme_init()
    if empty(glob('~/.vim/colors/seoul256mod.vim'))
      silent! exe '!curl -fLo ~/.vim/colors/seoul256mod.vim --create-dirs https://raw.githubusercontent.com/bruhtus/dotfiles/master/.config/nvim/colors/seoul256mod.vim'
      colo seoul256mod
      if $TERM !=# 'linux' && has('termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
      endif
    endif
  endfunction
  command! ColorsOn call s:colorscheme_init()
endtry

" Section: disable default plugin

let g:loaded_gzip             = 1
let g:loaded_tar              = 1
let g:loaded_tarPlugin        = 1
let g:loaded_zip              = 1
let g:loaded_zipPlugin        = 1
let g:loaded_2html_plugin     = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_spec             = 1
let g:loaded_logipat          = 1
let g:loaded_rrhelper         = 1
let g:loaded_vimballPlugin    = 1
let g:loaded_getscriptPlugin  = 1

" Section: default options

set title hidden showcmd linebreak lazyredraw complete-=t,i completeopt-=preview
set updatetime=0 timeoutlen=500 ttimeoutlen=30
set wildignorecase winminheight=0 matchpairs+=<:>
set splitbelow splitright number relativenumber
set wildmode=longest:full,full
set wildignore=*/.git/*,*.pdf,*.jpg,*jpeg,*.png,*.epub,*.mobi

set autoindent softtabstop=-69 shiftwidth=2 shiftround
autocmd vimrc BufEnter *
      \ execute 'setlocal '
      \ . (search('^\t', 'n') && !search('^  ', 'n') ? 'noexpandtab nosmarttab tabstop=2' :
      \ search('^\t', 'n') && search('^  ', 'n') ? 'noexpandtab smarttab' :
      \ 'expandtab smarttab')

set nobackup noswapfile nostartofline
set ignorecase smartcase incsearch
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set viminfo+=n~/.cache/vim/viminfo
set belloff=all backspace=indent,eol,start nrformats-=octal
set display+=lastline autoread
set sessionoptions-=options sessionoptions+=globals
set viewoptions-=options shortmess-=S shortmess+=F
set nolangremap langnoremap

if exists('+cursorlineopt') | set cursorline cursorlineopt=number | endif
if exists('+wildmenu') | set wildmenu | endif
if exists('&termwinkey') | set termwinkey=<C-p> | endif
if v:version > 703 || v:version == 703 && has('patch541') | set formatoptions+=j | endif
syntax on | filetype plugin indent on

" Section: default mappings

let mapleader = ' ' | let localmapleader = '\'

noremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>zz" :
      \ &buftype ==# 'nofile' ? "\<CR>" : ':'

if executable('rg')
  set grepprg=rg\ --smart-case\ --hidden\ --vimgrep\ -w
  set grepformat=%f:%l:%c:%m,%f
  nnoremap <silent> <BS> :execute "lgetexpr system('" . &grepprg . ' ' . expand("<cword>") . "')"<CR>
else
  nnoremap <silent> <BS> :execute "lvimgrep /\\<" . expand("<cword>") . "\\>/j **"<CR>
endif

nnoremap <S-Tab> <C-^>
" Ref: https://vi.stackexchange.com/a/2363/34851
execute "set <M-a>=\ea"
execute "set <M-~>=\e~"
inoremap <silent> <M-a> <C-g>u<C-o>a
inoremap <silent> <M-~> <C-g>u<C-o>~<C-[>
inoremap <silent> <M-U> <C-[>:t .<CR>==

if exists(':stopinsert') == 2
  execute "set <M-w>=\ew"
  inoremap <silent> <M-w> <C-o>w<C-o>:stopinsert<CR>
endif

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-q> <C-l>
inoremap <C-c> <C-[>
nnoremap <C-u> <C-u>M^
nnoremap <C-d> <C-d>M^
nnoremap <C-f> <C-f>H^
nnoremap <C-b> <C-b>L^

vnoremap <C-y> "+y
nnoremap <C-p> "+gp
nnoremap <silent> <leader>p :put +<CR>

nnoremap _ <C-w>_
nnoremap + <C-w>=
nnoremap = m'=

nnoremap / m'/
nnoremap ? m'?

nnoremap <silent> ]k :cn<CR>zz
nnoremap <silent> [k :cp<CR>zz
nnoremap <silent> ]l :lnext<CR>zz
nnoremap <silent> [l :lprevious<CR>zz

if exists('*getwininfo()')
  nnoremap <silent> ]<Space>
        \ :if empty(filter(getwininfo(), 'v:val.loclist')) <Bar>
        \   lopen <Bar>
        \ else <Bar>
        \   lclose <Bar>
        \ endif<CR>
  nnoremap <silent> [<Space>
        \ :if empty(filter(getwininfo(), 'v:val.quickfix')) <Bar>
        \   copen <Bar>
        \ else <Bar>
        \   cclose <Bar>
        \ endif<CR>
endif

nnoremap <silent> gb m':<C-u>call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
nnoremap <silent> gh m':<C-u>call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>

inoremap , <C-g>u,
inoremap . .<C-g>u

vnoremap < <gv
vnoremap > >gv

nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
nnoremap S "_S
nnoremap x "_x
nnoremap X "_X
nnoremap D "_D
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap cn *``"_cgn
nnoremap cN #``"_cgN

nnoremap Y y$
nnoremap J m`J``
nnoremap Q :lvimgrep /\v/j %<left><left><left><left>

nnoremap ZX :w<CR>
nnoremap <silent> ZA :on<CR>
nnoremap <silent> ZS :execute "lvimgrep /\\<" . expand("<cword>") . "\\>/j %"<CR>
nnoremap <silent> ZD :reg<CR>

nnoremap <expr> <silent> U (v:count ># 0 ? "m'" . v:count : '') . ":<C-u>execute 't +'. v:count<CR>=="
nnoremap <expr> <silent> ZU (v:count ># 0 ? "m'" . v:count : '') . ":<C-u>execute 't -1-'. v:count<CR>=="
nnoremap <expr> <silent> ZJ
      \ v:count1 ># 1 ? ":<C-u>execute '+1k` <Bar> move +'. v:count1<CR>==" :
      \ ":<C-u>execute 'move +'. v:count1<CR>=="
nnoremap <expr> <silent> ZK
      \ v:count1 ># 1 ? ":<C-u>execute '-1k` <Bar> move -1-'. v:count1<CR>==" :
      \ ":<C-u>execute 'move -1-'. v:count1<CR>=="

nnoremap <silent> ZH :<C-u>put!=repeat((nr2char(10)), v:count1)<Bar>']+1<CR>
nnoremap <silent> ZN :<C-u>put =repeat((nr2char(10)), v:count1)<Bar>'[-1<CR>

cnoremap <C-k> <up>
cnoremap <C-j> <down>

cnoremap <C-s> <left>
cnoremap <C-x> <right>

if has('patch-8.0.0877') | tnoremap <C-@> <C-\><C-n>| endif

nnoremap <leader>s :s//g<left><left>

if exists(':ter') | nnoremap <silent> <leader>m :ter<CR>| endif

" Section: plugin mappings and options (except quickr-preview.vim and fzf)

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#target_labels = ';aszxcfvqwertyuiopbnmABCEFGIJKNOPQRSTUVZ'
nmap <leader>k <Plug>SneakLabel_s
nmap <leader>j <Plug>SneakLabel_S
nmap <leader>n <Plug>(Bufstop-preview)

nmap cx <Plug>(Exchange)
nmap cxx <Plug>(ExchangeLine)

xmap gc  <Plug>Commentary
nmap gc  <Plug>Commentary
omap gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yss <Plug>Yssurround
xmap S   <Plug>VSurround

nmap [; <Plug>(IndentWisePreviousGreaterIndent)
nmap ]; <Plug>(IndentWiseNextGreaterIndent)
nmap [- <Plug>(IndentWisePreviousLesserIndent)
nmap ]- <Plug>(IndentWiseNextLesserIndent)
nmap [= <Plug>(IndentWisePreviousEqualIndent)
nmap ]= <Plug>(IndentWiseNextEqualIndent)

" Section: statusline

" Ref: https://github.com/itchyny/vim-gitbranch/blob/master/autoload/gitbranch.vim
function! GitBranchName() abort
  if get(b:, 'gitbranch_pwd', '') !=# expand('%:p:h') || !has_key(b:, 'gitbranch_path')
    call s:gitbranch_detect(expand('%:p:h'))
  endif
  if has_key(b:, 'gitbranch_path') && filereadable(b:gitbranch_path)
    let branch = get(readfile(b:gitbranch_path), 0, '')
    if branch =~# '^ref: '
      return substitute(branch, '^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=', '', '')
    elseif branch =~# '^\x\{20\}'
      return branch[:6]
    endif
  endif
  return ''
endfunction

function! s:gitbranch_dir(path) abort
  let path = a:path
  let prev = ''
  let git_modules = path =~# '/\.git/modules/'
  while path !=# prev
    let dir = path . '/.git'
    let type = getftype(dir)
    if type ==# 'dir' && isdirectory(dir.'/objects') && isdirectory(dir.'/refs') && getfsize(dir.'/HEAD') > 10
      return dir
    elseif type ==# 'file'
      let reldir = get(readfile(dir), 0, '')
      if reldir =~# '^gitdir: '
        return simplify(path . '/' . reldir[8:])
      endif
    elseif git_modules && isdirectory(path.'/objects') && isdirectory(path.'/refs') && getfsize(path.'/HEAD') > 10
      return path
    endif
    let prev = path
    let path = fnamemodify(path, ':h')
  endwhile
  return ''
endfunction

function! s:gitbranch_detect(path) abort
  unlet! b:gitbranch_path
  let b:gitbranch_pwd = expand('%:p:h')
  let dir = s:gitbranch_dir(a:path)
  if dir !=# ''
    let path = dir . '/HEAD'
    if filereadable(path)
      let b:gitbranch_path = path
    endif
  endif
endfunction

let s:save_cpo = &cpo
set cpo&vim laststatus=2 noshowmode

function! StatuslineComponent() abort

  if hlexists('NormalModeColor')
    if &showmode | set noshowmode | endif
    if mode() ==# 'n'
      let w:mode ='%#NormalModeColor# '
    elseif mode() ==# v:insertmode
      let w:mode ='%#InsertModeColor# '
    elseif mode() ==# 'v' || mode() ==# 'V' || mode() ==# "\<C-V>"
      let w:mode ='%#VisualModeColor# '
    elseif mode() ==# 'c' || mode() ==# 't'
      let w:mode ='%#CommandModeColor# '
    endif

  else
    if !&showmode | set showmode | endif
    let w:mode=''
  endif

  let l:filename = " %{expand('%:p:~') ==# '' ? '[Blank]' :
        \ winwidth(0) > 160 ? expand('%:p:~') :
        \ winwidth(0) < 71 ? expand('%:t') :
        \ pathshorten(expand('%'))}"
  let l:readonly = '%r'
  let l:mod = "%{&modified ? '  [+]' : !&modifiable ? '  [-]' : ''}"
  let l:ft = "%{winwidth(0) > 70 ? (len(&filetype) ? &filetype : 'no ft') : ''}"
  let l:git = '%{GitBranchName()}'
  let l:sep = '%='
  let l:line = '  %3l/%L'
  let l:tab = "%{&expandtab && &smarttab ? ' sw='.&shiftwidth.' ' :
        \ !&expandtab && !&smarttab ? ' ts='.&tabstop.' ' :
        \ ' sw='.&shiftwidth.',ts='.&tabstop.' '}"
  return w:mode.'%*'.l:tab.l:readonly.l:filename.l:mod.l:sep.l:git.'  '.l:ft.l:line
endfunction

function! StatuslineNcComponent() abort
  let l:filename = " %{expand('%:p:~') ==# '' ? '[Blank]' :
        \ winwidth(0) > 160 ? expand('%:p:~') :
        \ winwidth(0) < 71 ? expand('%:t') :
        \ pathshorten(expand('%'))}"
  let l:readonly = '%r'
  let l:mod = "%{&modified ? '  [+]' : !&modifiable ? '  [-]' : ''}"
  let l:sep = '%='
  return l:readonly.l:filename.l:mod.l:sep
endfunction

function! StatuslineLoad(mode)
  if a:mode ==# 'active'
    setlocal statusline=%!StatuslineComponent()
  else
    setlocal statusline=%!StatuslineNcComponent()
  endif
endfunction

autocmd vimrc WinEnter,BufWinEnter *
      \ if &buftype ==# 'quickfix'                 |
      \ elseif expand('%:t') ==# '--Bufstop--'     |
      \ else                                       |
      \   call s:gitbranch_detect(expand('%:p:h')) |
      \   call StatuslineLoad('active')            |
      \ endif

autocmd vimrc BufNewFile,BufReadPost *
      \ call s:gitbranch_detect(expand('<amatch>:p:h'))

autocmd vimrc WinLeave *
      \ if &buftype ==# 'quickfix'             |
      \ elseif expand('%:t') ==# '--Bufstop--' |
      \ else                                   |
      \   call StatuslineLoad('inactive')      |
      \ endif

let &cpo = s:save_cpo
unlet s:save_cpo

" Section: trim trailing whitespace

autocmd vimrc BufWritePre *
      \ let b:save = winsaveview() |
      \ keeppatterns %s/\s\+$//e   |
      \ call winrestview(b:save)   |
      \ unlet b:save

" Section: git root directory

autocmd vimrc BufEnter *
      \ if !exists('b:root_enabled') |
      \   silent! lcd %:p:h          |
      \ else                         |
      \   unlet b:root_enabled       |
      \   silent! lcd %:p:h          |
      \   call s:root_toggle()       |
      \ endif

nnoremap <silent> - :<C-u>call <SID>root_toggle()<CR>

function! s:root_toggle()
  if exists('b:root_enabled')
    unlet b:root_enabled
    unlet b:root_first_time
    execute 'lcd %:p:h'
    echo 'Root directory disabled'

  else
    let l:root = systemlist('git rev-parse --show-toplevel')[0]

    if v:shell_error
      echo 'Not in git repo directory'
    else
      let b:root_enabled = 1
      execute 'lcd ' . l:root
      if !exists('b:root_first_time')
        let b:root_first_time = 1
        echo 'Changed directory to: ' . l:root
      endif
    endif

  endif
endfunction

" Section: marks

function! s:mark_delete()
  let l:mark = nr2char(getchar())
  redraw
  execute "silent! delm " . l:mark
endfunction

function! s:mark_goto()
  let l:markslist = '\"' . "'.0abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  exe 'marks ' . l:markslist
  echo 'Mark: '
  let l:mark = nr2char(getchar())
  redraw
  try
    execute 'normal! `' . l:mark . 'zz'
  catch
  endtry
endfunction

nnoremap <silent> dm :<C-u>call <SID>mark_delete()<CR>
nnoremap <silent> <leader><Space> :<C-u>call <SID>mark_goto()<CR>

" Section: fzf

autocmd vimrc FileType fzf
      \ let b:ruler = &ruler            |
      \ set noruler
      \| autocmd BufLeave <buffer>
      \  let &ruler = b:ruler           |
      \  unlet b:ruler

if executable('rg')
  let $FZF_DEFAULT_COMMAND = "rg --hidden --files --no-ignore-vcs --type-not nonsense --type-not font --type-not torrent"
endif

let $FZF_DEFAULT_OPTS    = "--bind ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up --preview-window=wrap"

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-s': 'vsplit' }

let g:fzf_preview_window = ['up:50%:hidden', 'ctrl-/']

" Note: need to use original command for lazy load in vim-plug
nnoremap <silent> <leader>i :<C-u>silent! Files<CR>
nnoremap <silent> <leader>f :<C-u>silent! Files ~<CR>
nnoremap <silent> <leader>h :<C-u>silent! Lines<CR>
nnoremap <silent> <leader>u :<C-u>silent! BLines<CR>
nnoremap <silent> <leader>o :<C-u>silent! Rg<CR>

" Section: netrw

let g:loaded_netrwPlugin       = 0
nnoremap gx :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>

" Section: quickfix and location list

autocmd vimrc FileType qf
      \ setlocal nowrap |
      \ let g:quickr_preview_exit_on_enter = 1 |
      \ let g:quickr_preview_line_hl       = 'search' |
      \ let g:quickr_preview_options       = 'number norelativenumber nofoldenable scrolloff=999 colorcolumn=' |
      \ nmap <buffer> <nowait> d <C-d>
      \| nmap <buffer> <nowait> u <C-u>
      \| nmap <buffer> <silent> i :cclose <Bar> lclose <Bar> pclose<CR>
      \| nmap <buffer> <silent> <nowait> m <CR>zz
      \| nmap <buffer> <nowait> <Space> <Plug>(quickr_preview)

autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost l*    lwindow
autocmd vimrc WinEnter * if winnr('$') == 1 && &buftype == 'quickfix' | q | endif

" Section: markdown filetype

autocmd vimrc FileType markdown
      \ nnoremap <buffer> <silent> ]] m':<C-u>call search('\v^\S*(#)', 'W')<CR>zz
      \| nnoremap <buffer> <silent> [[ m':<C-u>call search('\v^\S*(#)', 'zbW')<CR>zz
      \| nnoremap <buffer> <silent> ][ m':<C-u>call search('\v%$\|\S.*\n+(#)', 'W')<CR>zz
      \| nnoremap <buffer> <silent> [] m':<C-u>call search('\v\S.*\n+(#)', 'bW')<CR>zz
      \| onoremap <buffer> <silent> ]] :<C-u>call search('\v^\S*(#)', 'W')<CR>
      \| onoremap <buffer> <silent> [[ :<C-u>call search('\v^\S*(#)', 'zbW')<CR>

" Section: gitcommit filetype

autocmd vimrc FileType gitcommit
      \ setlocal spell complete+=kspell |
      \ nnoremap <expr> <buffer> <silent> <localleader>\ exists(':DiffGitCached') == 2 ? ':DiffGitCached<CR>' : ''

" vim:et sta sw=2 sts=-69

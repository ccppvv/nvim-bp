" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.config/nvim/plugged')
Plug 'tmhedberg/matchit'
Plug 'rizzatti/dash.vim'
Plug 'mattn/emmet-vim'
imap <c-e> <c-y>,
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

Plug 'ap/vim-buftabline'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'NLKNguyen/papercolor-theme'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/vista.vim'
Plug 'taigacute/gruvbox9'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.78', 'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'roman/golden-ratio'
Plug 'hotoo/jsgf.vim'
Plug 'kassio/neoterm'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'posva/vim-vue', {'for': ['vue']}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' "gc
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-exchange'
let g:gitgutter_max_signs=9000
Plug 'kshenoy/vim-signature'
Plug 'jiangmiao/auto-pairs'
Plug 'psychollama/further.vim'
Plug 'konfekt/fastfold'
let g:javaScript_fold = 1
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install', 'for': [ 'markdown', 'md']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'jremmen/vim-ripgrep'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'iamcco/markdown-preview.nvim'
Plug 'heavenshell/vim-jsdoc'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'

" Plug 'maxmellon/vim-jsx-pretty', {'for': [ 'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx']}
" coc extensions
let g:coc_global_extensions = [
      \ 'coc-tslint-plugin',
      \ 'coc-tsserver',
      \ 'coc-project',
      \ 'coc-git',
      \ 'coc-css',
      \ 'coc-pairs',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-yank',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-vetur',
      \ 'coc-python',
      \ 'coc-highlight',
      \ 'coc-todolist',
      \ 'coc-translator',
      \ 'coc-eslint',
      \ ]

let g:python3_host_prog = '/usr/local/bin/python3.8'

" Initialize plugin system
call plug#end()

let s:script_cwd = expand('<sfile>:p:h')
let s:source_list = [
      \ 'config',
      \]

for s:item in s:source_list
  let s:path = split(globpath(s:script_cwd . '/' . s:item, '*.vim'), '\n')
  for s:cfg in s:path
    if filereadable(s:cfg)
      execute 'source' . s:cfg
    endif
  endfor

endfor

unlet s:script_cwd
unlet s:source_list
inoremap jk <ESC>

let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
let g:prettier#autoformat = 1
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
" noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" always uses spaces instead of tab characters
set expandtab

" coc config
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" highlight CocHighlightText ctermbg=none gui=underline
autocmd CursorHold * silent call CocActionAsync('highlight')


" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`

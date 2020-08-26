" Plugin vim-coc {
  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=1

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
	let g:coc_snippet_next = '<tab>'
  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  " nmap <silent> gd <Plug>(coc-definition)
  " nmap <silent> gy <Plug>(coc-type-definition)
  " nmap <silent> gi <Plug>(coc-implementation)
  " nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Highlight symbol under cursor on CursorHold
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  " highlight CocHighlightText term=underline gui=underline

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  "xmap <leader>k  <Plug>(coc-format-selected)
  "nmap <leader>k  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " nmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  "nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  "nmap <leader>qf  <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  " nmap <silent> <TAB> <Plug>(coc-range-select)
  " xmap <silent> <TAB> <Plug>(coc-range-select)
  " xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  nnoremap <silent><leader>e :Format<cr>

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  "
  " grep word under cursor
  command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

  function! s:GrepArgs(...)
    let list = ['-S', '-smartcase', '-I', '-ignorecase', '-w', '-word',
          \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
    return join(list, "\n")
  endfunction

  " Keymapping for grep word under cursor with interactive mode
  nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
  " Show all diagnostics
  " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"}

" Plugin vim-ariline & indent line{
  let g:airline_theme='alduin'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'default'
  let g:indentLine_setColors = 0
  let g:indentLine_char = '┆'
  let g:indentLine_conceallevel = 0
"}
"

" Plugin ense-analysis/ale{
  let g:ale_sign_column_always = 1
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚡️'
  let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
  highlight clear ALEErrorSign
  highlight clear ALEWarningSign
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  function! LinterStatus() abort
      let l:counts = ale#statusline#Count(bufnr(''))

      let l:all_errors = l:counts.error + l:counts.style_error
      let l:all_non_errors = l:counts.total - l:all_errors

      return l:counts.total == 0 ? 'OK' : printf(
      \   '%dW %dE',
      \   all_non_errors,
      \   all_errors
      \)
  endfunction
  set statusline=%{LinterStatus()}
  " let b:ale_linter_aliases = ['javascript', 'vue', 'css']
  " Select the eslint and vls linters.
  " let b:ale_linters = ['eslint', 'vls', 'stylelint']

"}

" Plugin nerdtree {
  map <leader>j :NERDTreeToggle<CR>
  map <leader>f  :NERDTreeFind<CR>
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', 'node_modules']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
  let g:nerdtree_tabs_open_on_gui_startup=0
  let g:NERDTreeGitStatusWithFlags = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:NERDTreeGitStatusNodeColorization = 1
  let g:NERDTreeColorMapCustom = {
      \ "Staged"    : "#0ee375",
      \ "Modified"  : "#d9bf91",
      \ "Renamed"   : "#51C9FC",
      \ "Untracked" : "#FCE77C",
      \ "Unmerged"  : "#FC51E6",
      \ "Dirty"     : "#FFBD61",
      \ "Clean"     : "#87939A",
      \ "Ignored"   : "#808080"
      \ }

" }
" Plugin neoterm {
  let g:neoterm_default_mod='belowright' " open terminal in bottom split
  let g:neoterm_size=16 " terminal split size
  let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
  " nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
  " vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection
  map <leader><cr> :T ls<cr><space>j<cr>" send current line and move down
" }

" Plugin ctrlsf {
  let g:ctrlsf_position = 'right'
  let g:ctrlsf_winsize = '60%'
  nmap <space>ff :CtrlSF<space>
"}

" Plugin vim-buftabline {
  let g:buftabline_separators='|'
  let g:buftabline_indicators='true'
"}

" Plugin ag {
  nmap <space>gg :Ag<space>
"}

" Plugin ripgrep {
  nnoremap <space>gg :Rg <cr>
  nnoremap <space>gc :Rg<space>
"}
" Plugin ctrlp {
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  let g:ctrlp_dont_split = 'nerdtree'
  nmap <space>pp <c-p>
  nmap <space>jk <c-p>
  nmap <space>;; <c-p>
"}

" Plugin devicons {
  set guifont=<FONT_NAME>:h<FONT_SIZE>
  set guifont=Fira\ Code\ Nerd\ Font:h15
  if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
  endif
  if !exists('g:syntax_on')
    syntax enable
  endif
  let g:webdevicons_enable = 1
  let g:airline_powerline_fonts = 1
  let g:webdevicons_enable_nerdtree = 1
  let g:webdevicons_enable_unite = 1
  let g:webdevicons_enable_vimfiler = 0
  let g:webdevicons_enable_airline_tabline = 1
  let g:webdevicons_enable_airline_statusline = 1
  let g:webdevicons_enable_ctrlp = 1
  let g:webdevicons_enable_startify = 1
  let g:WebDevIconsUnicodeDecorateFileNodes = 0
  let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
  let g:webdevicons_conceal_nerdtree_brackets = 0
  let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
  let g:webdevicons_enable_denite = 1
  let g:WebDevIconsTabAirLineAfterGlyphPadding = ' '
  let g:WebDevIconsTabAirLineBeforeGlyphPadding = ' '
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
  let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
  let g:DevIconsEnableFolderPatternMatching = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1
  let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
  " let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '+'
  " let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = 'F'
  " let g:DevIconsDefaultFolderOpenSymbol = '-'
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'ƛ'
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['MyReallyCoolFile.okay'] = 'ƛ'
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'ƛ'
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*jquery.*\.js$'] = 'ƛ'
  let g:WebDevIconsOS = 'Darwin'

  let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
  let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
  let g:NERDTreeDirArrowExpandable = "\u00a0"
  let g:NERDTreeDirArrowCollapsible = "\u00a0"


" }

" Plugin NerdCommenter {
  let g:NERDSpaceDelims = 1
  let g:rainbow_active = 1
" }

" Plugin easymotion {
  nmap <space> <Plug>(easymotion-prefix)
  let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
  nmap s <Plug>(easymotion-s)
  function! s:config_fuzzyall(...) abort
    return extend(copy({
    \   'converters': [
    \     incsearch#config#fuzzy#converter(),
    \     incsearch#config#fuzzyspell#converter()
    \   ],
    \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> <space>/ incsearch#go(<SID>config_fuzzyall())
  noremap <silent><expr> <space>? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
  noremap <silent><expr> <space>g? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
" }

" Plugin LeaderF {
  " search word under cursor, the pattern is treated as regex, and enter normal mode directly
  "noremap <leader>f :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
  " search word under cursor, the pattern is treated as regex,
  " append the result to previous search results.
  "noremap <leader>g :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
  " search word under cursor literally only in current buffer
  " noremap <leader>b :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
  " search visually selected text literally, don't quit LeaderF after accepting an entry
  " xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
  " recall last search. If the result window is closed, reopen it.
  noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>
  let g:Lf_WindowPosition = 'popup'
  let g:Lf_ShortcutF = '<C-P>'
  let g:Lf_WorkingDirectoryMode = 'Ac'
  " let g:Lf_WorkingDirectory = finddir('.git', '.;')
" }
" Plugin fugitive {
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
" }

" Plugin MarkdownPreview {
map <leader>p <Plug>MarkdownPreview
" }
"
" Plugin VimTodoHighlight {
let g:todo_highlight_config = {
      \   'TODO': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#df2211',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '214'
      \   },
      \   'FIXME': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#f06292',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '204'
      \   },
      \   'REVIEW': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#fff0cc',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '214'
      \   },
      \   'NOTE': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#616cad',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '214'
      \   }
      \ }
" }

" Plugin Goyo {
let g:goyo_width=100
let g:goyo_height=100
" }

" Plugin GitGutter {
let g:gitgutter_max_signs=9000
" }
" Plugin Nerdtree-git-plugin  {
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : "☒",
    \ "Unknown"   : "?"
    \ }
" }
"
" Plugin Emmet {
  imap <c-e> <c-y>,
  let g:user_emmet_settings = {
    \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
    \}

" }
"
" Plugin buftabline {
  let g:buftabline_separators='|'
  let g:buftabline_indicators='true'
  set hidden
  nmap <C-l> :bnext<CR>
  nmap <C-h> :bprev<CR>
" }

" Plugin vim-jsdoc {
  nmap <silent> <leader>d <Plug>(jsdoc)
  let g:jsdoc_allow_input_prompt = 0
  let g:jsdoc_enable_es6 = 1
  let g:jsdoc_access_descriptions = 2
  let g:jsdoc_underscore_private = 1
  let g:jsdoc_custom_args_regex_only = 1
  let g:jsdoc_custom_args_hook = {
        \ '^\(callback\|cb\)$': {
        \   'type': ' {Function} ',
        \   'description': 'Callback function'
        \ },
        \ '\(err\|error\)$': {
        \   'type': '{Error}'
        \ },
        \ '^\(opt\|options\)$': {
        \   'type': '{Object}'
        \ },
        \ 'handler$': {
        \   'type': '{Function}'
        \ },
        \ '^\(n\|i\)$': {
        \   'type': ' {Number} '
        \ },
        \ '^i$': {
        \   'type': ' {Number} '
        \ },
        \ '^num': {
        \   'type': ' {Number} '
        \ },
        \ '^_\?\(is\|has\)': {
        \   'type': ' {Boolean} '
        \ },
        \ '^arr$': {
        \   'type': ' {Array} '
        \ },
        \ '^str$': {
        \   'type': ' {String} '
        \ },
        \ '^e$': {
        \   'type': ' {Event} '
        \ },
        \ 'el$': {
        \   'type': ' {Element} '
        \ },
        \ '^node$': {
        \   'type': ' {Element} '
        \ },
        \ '^o$': {
        \   'type': ' {Object} '
        \ },
        \ '^obj$': {
        \   'type': ' {Object} '
        \ },
        \ '^fn$': {
        \   'type': ' {Function} '
        \ },
        \}
" }

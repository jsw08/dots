{ config, pkgs, ... }:
{
  packages.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      vim-surround
      nerdtree
      vim-fugitive
      nvim-treesitter
      
      vim-svelte
      vim-polyglot

      vim-airline
      vim-airline-themes
      gruvbox-nvim

      coc-svelte
      coc-tsserver
      coc-json
      coc-python
      coc-tailwindcss
      coc-css
    ];
    coc = {
      enable = true;
      settings = {
        "suggest.noselect" = true;
        "suggest.enablePreview" = true;
        "suggest.enablePreselect" = false;
        "suggest.disableKind" = true;
      };
    };
    extraConfig = ''
      set nobackup
      set nowritebackup
      set updatetime=300
      set relativenumber
      set clipboard=unnamedplus
      set tabstop=4
      set shiftwidth=4
      set expandtab
      let g:svelte_preprocessors = ['typescript']

      let g:airline_theme='gruvbox'
      set background=dark
      colorscheme gruvbox

      " Coc
      inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
      inoremap <silent><expr> <c-space> coc#refresh()
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
      nnoremap <silent> K :call ShowDocumentation()<CR>
      xmap <leader>f  <Plug>(coc-format-selected)
      nmap <leader>f  <Plug>(coc-format-selected)
      function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
          call CocActionAsync('doHover')
        else
          call feedkeys('K', 'in')
        endif
      endfunction
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
      " provide custom statusline: lightline.vim, vim-airline
      set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    '';
  };
}
{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      toggleterm-nvim
      nvim-autopairs
      fzf-lua

      vim-surround
      vim-fugitive
      (nvim-treesitter.withPlugins (ps: with ps; [ 
        html
        css
        javascript
        typescript
        svelte
        python 
      ]))
      nvim-treesitter-textobjects
      
      vim-svelte
      vim-polyglot
      coc-svelte
      coc-sh
      coc-git
      coc-json
      coc-css
      coc-tailwindcss
      coc-html
      coc-tslint
      coc-eslint
      coc-tsserver
      coc-prettier
      coc-python


      lualine-nvim
      nvim-web-devicons
      catppuccin-nvim

    ];
    coc = {
      enable = true;
      settings = {
        "suggest.noselect" = true;
        "svelte.enable-ts-plugin" = true;
      };
    };
    extraConfig = ''
      " Config
      set nobackup
      set nowritebackup
      set hidden
      set relativenumber
      set clipboard=unnamedplus
      set tabstop=4
      set shiftwidth=4
      set expandtab
      let mapleader = ","
      let g:svelte_preprocessors = ['typescript']

      " Looks
      set termguicolors
      set background=dark

      lua require("catppuccin").setup({flavour = "frappe"})
      colorscheme catppuccin

      " Bindings
      nmap <silent><leader>b :FzfLua buffers<CR>
      nmap <silent><C-o> :FzfLua files<CR>
      nmap <silent><leader>f :FzfLua grep<CR>
      nmap <silent><leader><tab> :FzfLua tabs<CR>
    
      " Coc + Bindings
      set updatetime=300
      nmap <silent> gh <Plug>(coc-type-definition)
      imap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
      imap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      imap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      imap <silent><expr> <c-space> coc#refresh()
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " Lua plugins
      lua require("nvim-autopairs").setup({})
      lua require("toggleterm").setup({open_mapping = [[<c-space>]], insert_mappings = true, terminal_mappings = true,})
      lua require("lualine").setup({})
    '';
  };
  home.packages = with pkgs; [
    fzf
    ripgrep
  ];
}

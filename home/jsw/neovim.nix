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
      nvim-treesitter
      
      nvim-lspconfig
      vim-svelte
      vim-polyglot

      lualine-nvim
      nvim-web-devicons
      gruvbox-flat-nvim

    ];
    coc = {
      enable = true;
      settings = {
        "suggest.noselect": true;
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

      " Plugin config
      let g:svelte_preprocessors = ["typescript"]

      " Looks
      set termguicolors
      set background=dark
      colorscheme gruvbox-flat

      " Bindings
      nmap <silent><leader>b :FzfLua buffers<CR>
      nmap <silent><C-o> :FzfLua files<CR>
      nmap <silent><leader>f :FzfLua grep<CR>
      nmap <silent><leader><tab> :FzfLua tabs<CR>
    
      " Coc + Bindings
      set updatetime-300
      inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      inoremap <silent><expr> <c-space> coc#refresh()
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " Lua plugins
      lua require("nvim-autopairs").setup({})
      lua require("toggleterm").setup({open_mapping = [[<c-space>]], insert_mappings = true, terminal_mappings = true,})
      lua require("lualine").setup({options={theme="gruvbox-flat"}})
    '';
  };
  home.packages = with pkgs; [
    fzf
  ];
}

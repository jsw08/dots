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

      vim-surround
      nerdtree
      vim-fugitive
      nvim-treesitter
      
      vim-svelte
      vim-polyglot

      vim-airline
      vim-airline-themes
      gruvbox-nvim

    ];
    extraConfig = ''
      set nobackup
      set nowritebackup
      set hidden
      set relativenumber
      set clipboard=unnamedplus
      set tabstop=4
      set shiftwidth=4
      set expandtab
      let g:svelte_preprocessors = ['typescript']

      set background=dark
      colorscheme gruvbox

      lua require("nvim-autopairs").setup{}

      lua require("toggleterm").setup({})
      imap <silent> <c-/> :ToggleTerm<CR> 
      nmap <silent> <c-/> :ToggleTerm<CR> 
      tmap <silent> <c-/> :ToggleTerm<CR> 

    '';
  };
}

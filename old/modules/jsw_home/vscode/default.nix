{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.svelte.svelte-vscode
      vscode-extensions.vscodevim.vim
      vscode-extensions.ms-pyright.pyright
      vscode-extensions.bbenoist.nix
      vscode-extensions.ms-python.python
      vscode-extensions.jdinhlife.gruvbox
    ];
    userSettings = {
      "[python]" = {
        "editor.formatOnType" = true;
      };
      "editor.tabSize" = 2;
      "files.autoSave" = "onFocusChange";
      "git.enableSmartCommit" = true;
      "vim.useSystemClipboard" = true;
      "window.menuBarVisibility" = "hidden";
      "vim.smartRelativeLine" = true;
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "svelte.enable-ts-plugin" = true;
    };
  };
}

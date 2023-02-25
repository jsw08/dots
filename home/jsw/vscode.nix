{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.svelte.svelte-vscode
      vscode-extensions.vscodevim.vim
      vscode-extensions.ms-pyright.pyright
      vscode-extensions.github.copilot
      vscode-extensions.bbenoist.nix
    ];
    userSettings = {
      "window.menuBarVisibility" = "hidden";
      "vim.sneak" = true;
      "vim.sneakReplacesF" = true;
      "files.autoSave" = "onFocusChange";
      "vim.useSystemClipboard" = true;
      "editor.tabSize" = 2;
    };
  };
}

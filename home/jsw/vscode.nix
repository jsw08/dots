{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.svelte.svelte-vscode
      vscode-extensions.vscodevim.vim
      vscode-extensions.ms-pyright.pyright
      vscode-extensions.github.copilot
    ];
  };
}

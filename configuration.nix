# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
  ];

  # wsl.enable = true;
  wsl.defaultUser = "inifo";
  
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
  };
  users.extraUsers.inifo = {
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    vscode
    wget
    gcc
    nodejs
    ripgrep
    tree-sitter
    zip
    unzip
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };

      vim.theme.enable = true;
      vim.theme.name = "gruvbox";
      vim.theme.style = "dark";

      vim.statusline.lualine.enable = true;

      vim.languages.nix.enable = true;
      vim.languages.rust.enable = true;
      vim.languages.clang.enable = true;
      vim.languages.enableTreesitter = true;

      vim.autocomplete.nvim-cmp.enable = true;

      vim.telescope.enable = true;
    };
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "25.05"; # Did you read the comment?
}

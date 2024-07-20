{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
      vimdiffAlias = true;
      package = inputs.neovim.packages.${pkgs.system}.default;
      extraPackages = with pkgs; [
        ripgrep
        fd
        # language server
        clang-tools
        nixd
        lua-language-server

        # formatter
        stylua
        nixfmt-classic
        prettierd
        alejandra

        # lints
        statix
        eslint_d
      ];
    };
  };
}

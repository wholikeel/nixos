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
        delta
        # language server
        clang-tools
        nixd
        lua-language-server
        # for lazy
        (luajit.withPackages (ps: with ps; [ luarocks ]))

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

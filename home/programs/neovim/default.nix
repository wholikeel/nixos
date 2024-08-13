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
        markdown-oxide
        lua-language-server
        # for lazy
        (luajit.withPackages (ps: with ps; [ luarocks ]))

        # formatter
        stylua
        nixfmt-classic
        prettierd
        alejandra
        jq
        libxml2

        # lints
        statix
        eslint_d

        # For http
        curlFull
      ];
    };
  };
}

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.8";
	  hide_window_decorations = true;
      allow_remote_control = true;
    };
    font = {
      name = "JetBrainsMono NFM Regular";
      size = 18;
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}

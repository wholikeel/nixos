{
  programs.newsboat = {
    enable = true;
    extraConfig = builtins.readFile ./config;
    urls = [
      {
        title = "Not related - Luke Smith";
        url = "https://notrelated.xyz/rss";
        tags = [
          "Anarchism"
          "Antifragile"
          "Consciousness"
          "History"
          "Ideas"
          "Intellectual"
          "Right"
          "anthropology"
          "archeology"
          "bronze"
          "class"
          "classics"
          "economics"
          "epistemology"
          "evolution"
          "genetics"
          "gnu"
          "linux"
          "luke"
          "memes"
          "modern"
          "primitivism"
          "science"
          "smith"
          "social"
          "technology"
        ];
      }
    ];
  };
}

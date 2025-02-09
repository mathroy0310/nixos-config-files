{
  programs.ranger = {
    enable = true;
    mappings = {
      e = "edit";

      ec = "compress";
      ex = "extract";
    };

    settings = {
      preview_images = true;
      preview_images_method = "ueberzug";
      draw_borders = true;
      w3m_delay = 0;
    };

    extraConfig = ''
      default_linemode devicons2
    '';
    
  };
}
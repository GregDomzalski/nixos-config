{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.desktop;
in {
  config = mkIf (cfg.enable && cfg.xdgDirectories.enable) {
    # Configure XDG user directories
    xdg.userDirs = {
      enable = true;
      createDirectories = true;

      # Standard XDG directories
      desktop = "${config.home.homeDirectory}/Desktop";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      pictures = "${config.home.homeDirectory}/Pictures";
      music = "${config.home.homeDirectory}/Music";
      videos = "${config.home.homeDirectory}/Videos";

      # Disable unused directories
      publicShare = null;
      templates = null;

      # Custom directories via extraConfig
      extraConfig = {
        XDG_AUDIOBOOKS_DIR = "${config.home.homeDirectory}/Audio Books";
        XDG_BOOKS_DIR = "${config.home.homeDirectory}/Books";
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
      };
    };

    # Install custom icon files
    xdg.dataFile = {
      # Custom icon for Audio Books
      "icons/folder-audiobook.svg".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/KDE/breeze-icons/master/icons/places/64/folder-book.svg";
        sha256 = "1350mx5hks5izdrp2jn31plai7jfddhwbs99mqm16asvq3da5y38";
      };

      # Custom icon for Books
      "icons/folder-book.svg".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/KDE/breeze-icons/master/icons/places/64/folder-book.svg";
        sha256 = "1350mx5hks5izdrp2jn31plai7jfddhwbs99mqm16asvq3da5y38";
      };
    };

    # Create .directory files for folder icon customization
    home.file = {
      "Documents/.directory".text = ''
        [Desktop Entry]
        Icon=folder-documents
      '';

      "Downloads/.directory".text = ''
        [Desktop Entry]
        Icon=folder-download
      '';

      "Pictures/.directory".text = ''
        [Desktop Entry]
        Icon=folder-pictures
      '';

      "Music/.directory".text = ''
        [Desktop Entry]
        Icon=folder-music
      '';

      "Videos/.directory".text = ''
        [Desktop Entry]
        Icon=folder-videos
      '';

      "Audio Books/.directory".text = ''
        [Desktop Entry]
        Icon=${config.home.homeDirectory}/.local/share/icons/folder-audiobook.svg
      '';

      "Books/.directory".text = ''
        [Desktop Entry]
        Icon=${config.home.homeDirectory}/.local/share/icons/folder-book.svg
      '';

      "Projects/.directory".text = ''
        [Desktop Entry]
        Icon=folder-design
      '';
    };

    # Configure Dolphin Places sidebar
    xdg.dataFile."user-places.xbel".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE xbel>
      <xbel xmlns:bookmark="http://www.freedesktop.org/standards/desktop-bookmarks"
            xmlns:kdepriv="http://www.kde.org/kdepriv"
            xmlns:mime="http://www.freedesktop.org/standards/shared-mime-info">
       <info>
        <metadata owner="http://www.kde.org">
         <kde_places_version>4</kde_places_version>
        </metadata>
       </info>

       <!-- Home -->
       <bookmark href="file://${config.home.homeDirectory}">
        <title>Home</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="user-home"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Documents -->
       <bookmark href="file://${config.home.homeDirectory}/Documents">
        <title>Documents</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-documents"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Downloads -->
       <bookmark href="file://${config.home.homeDirectory}/Downloads">
        <title>Downloads</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-download"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Pictures -->
       <bookmark href="file://${config.home.homeDirectory}/Pictures">
        <title>Pictures</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-pictures"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Music -->
       <bookmark href="file://${config.home.homeDirectory}/Music">
        <title>Music</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-music"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Videos -->
       <bookmark href="file://${config.home.homeDirectory}/Videos">
        <title>Videos</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-videos"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Audio Books -->
       <bookmark href="file://${config.home.homeDirectory}/Audio Books">
        <title>Audio Books</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-sound"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Books -->
       <bookmark href="file://${config.home.homeDirectory}/Books">
        <title>Books</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-documents"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Projects -->
       <bookmark href="file://${config.home.homeDirectory}/Projects">
        <title>Projects</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="folder-design"/>
         </metadata>
        </info>
       </bookmark>

       <!-- Trash -->
       <bookmark href="trash:/">
        <title>Trash</title>
        <info>
         <metadata owner="http://freedesktop.org">
          <bookmark:icon name="user-trash"/>
         </metadata>
        </info>
       </bookmark>
      </xbel>
    '';
  };
}

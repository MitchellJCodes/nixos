{ ... }:

{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      # Browser
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "text/html" = "librewolf.desktop";
      "application/xhtml+xml" = "librewolf.desktop";

      # File manager
      "inode/directory" = "org.gnome.Nautilus.desktop";

      # Images
      "image/*" = "org.gnome.Loupe.desktop";

      # PDF and documents
      "application/pdf" = "org.kde.okular.desktop";
      "application/epub+zip" = "org.kde.okular.desktop";
      "application/x-cbz" = "org.kde.okular.desktop";
      "application/x-cbr" = "org.kde.okular.desktop";
      "image/vnd.djvu" = "org.kde.okular.desktop";

      # Text
      "text/plain" = "org.gnome.TextEditor.desktop";
      "text/markdown" = "org.gnome.TextEditor.desktop";

      # Video
      "video/*" = "org.gnome.Showtime.desktop";

      # Audio
      "application/x-ogg" = "org.gnome.Rhythmbox3.desktop";
      "application/ogg" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-vorbis+ogg" = "org.gnome.Rhythmbox3.desktop";
      "audio/vorbis" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-vorbis" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-scpls" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-mp3" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-mpeg" = "org.gnome.Rhythmbox3.desktop";
      "audio/mpeg" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-mpegurl" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-flac" = "org.gnome.Rhythmbox3.desktop";
      "audio/mp4" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-it" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-mod" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-s3m" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-stm" = "org.gnome.Rhythmbox3.desktop";
      "audio/x-xm" = "org.gnome.Rhythmbox3.desktop";

      # Archives
      "application/zip" = "xarchiver.desktop";
      "application/x-7z-compressed" = "xarchiver.desktop";
      "application/x-rar" = "xarchiver.desktop";
      "application/x-tar" = "xarchiver.desktop";
      "application/gzip" = "xarchiver.desktop";
      "application/x-gzip" = "xarchiver.desktop";
      "application/x-bzip2" = "xarchiver.desktop";
      "application/x-xz" = "xarchiver.desktop";
      "application/x-compressed-tar" = "xarchiver.desktop";

      # LibreOffice
      "application/msword" = "writer.desktop";
      "application/vnd.ms-excel" = "calc.desktop";
      "application/vnd.ms-powerpoint" = "impress.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "impress.desktop";
      "application/vnd.oasis.opendocument.text" = "writer.desktop";
      "application/vnd.oasis.opendocument.spreadsheet" = "calc.desktop";
      "application/vnd.oasis.opendocument.presentation" = "impress.desktop";
    };
  };
}

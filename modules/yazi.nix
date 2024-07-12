{ ... }:
{
  programs.yazi = {
    enable = true;

    settings.yazi = {
      manager = {
        show_hidden = true;
      };
    };

    settings.keymap = {
      manager.prepend_keymap = [
        { run = "plugin --sync smart-enter"; on = [ "l" ]; }
        { run = "plugin --sync smart-enter"; on = [ "<Enter>" ]; }
        { run = "plugin --sync smart-paste"; on = [ "p" ]; }
      ];
    };

    plugins = {
      smart-enter = ../.config/yazi/plugins/smart-enter.yazi;
      smart-paste = ../.config/yazi/plugins/smart-paste.yazi;
    };
  };
}

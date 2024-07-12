{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      die = "poweroff";
      c = "clear";
      ip = "ip -color=auto";
      ls = "ls --color=auto";
      l = "ls -l";
      ll = "ls -lahF";
      gitacp = "git add --all && git commit -m \"\$(curl -s https://whatthecommit.com/index.txt)\" && git push";
      inv = "nvim \$(fzf -m --preview=\"bat --color=always {}\")";
      up = "sh ~/nixos/sync-system.sh";
      hup = "sh ~/nixos/sync-user.sh";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    sessionVariables = { };
    initExtra = ''
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      if [[ -n "$SSH_CLIENT" ]]; then
        export TERM=xterm
      fi
    '';
  };

  home.packages = with pkgs; [
    zsh-fzf-tab
    zsh-fzf-history-search
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}

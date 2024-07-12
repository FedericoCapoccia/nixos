{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "166076838+FedericoCapoccia@users.noreply.github.com";
    userName = "Federico Capoccia";
    extraConfig = {
      init = {
        defaultBranch = "master";
      };
    };
  };
}

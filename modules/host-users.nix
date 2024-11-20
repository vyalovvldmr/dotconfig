{
  username,
  hostname,
  ...
} @ args:
{
  networking.hostName = hostname;
  networking.computerName = hostname;

  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };

  nix.settings.trusted-users = [username];
}
# Configs
My working environment configs

## First Install

1. Change hostname:

    ```shell
    sudo scutil --set HostName <new host name>
    sudo scutil --set LocalHostName <new host name>
    sudo scutil --set ComputerName <new name>
    ```

1. Edit hostname in the nix file

1. Turn FileVault off

1. Run command

    ```shell
    just install
    ```

1. Turn FileVault on
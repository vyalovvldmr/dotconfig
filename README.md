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

1. Install temporary just for single use

    ```shell
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /tmp/just
    ```

1. Run command

    ```shell
    /tmp/just install
    ```

1. Turn FileVault on


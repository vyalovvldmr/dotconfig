{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        helix
      ];
      environment.variables.EDITOR = "hx";

      #  TODO To make this work, homebrew need to be installed manually, see https://brew.sh
      # 
      # The apps installed by homebrew are not managed by nix, and not reproducible!
      # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
      homebrew = {
        enable = true;

        onActivation = {
          autoUpdate = false;
          # 'zap': uninstalls all formulae(and related files) not listed here.
          cleanup = "zap";
        };

        taps = [
          "homebrew/services"
        ];

        casks = [
          "font-meslo-lg-nerd-font"
          "firefox"
          "visual-studio-code"
          "telegram"
          "kitty"
          "keepassxc"
          "slack"
          "docker"
          "sublime-text"
          "obsidian"
        ];
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;
      environment.shells = [
        pkgs.zsh
      ];

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      
      # Add ability to use TouchID for sudo authentication
      security.pam.enableSudoTouchIdAuth = true;

      system = {
        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 5;
        
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;
        
        # Activation Scripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
        activationScripts.postUserActivation.text = ''
          # activateSettings -u will reload the settings from the database and apply them to the current session,
          # so we do not need to logout and login again to make the changes take effect.
          /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
        '';

        defaults = {
          dock = {
            autohide = true;
            autohide-delay = 0.0;  # remove autohide delay, Dock appears instantly
            autohide-time-modifier = 0.0;  # remove autohide animation
            show-recents = false;  # disable recent apps
            showhidden = true;  # make Dock icons of hidden applications translucent
            persistent-apps = [];  # remove all apps from Dock
            mru-spaces = false;  # don't automatically rearrange Spaces based on most recent use
            appswitcher-all-displays = true;  # display the appswitcher on all displays
            minimize-to-application = true;  # minimize windows into their application icon
            mineffect = "scale";  # change minimize/maximize window effect
          };

          finder = {
            QuitMenuItem = true;  # allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
            _FXShowPosixPathInTitle = true;  # show full path in finder title
            AppleShowAllExtensions = true;  # show all file extensions
            FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
            ShowPathbar = true;  # show path bar
            ShowStatusBar = true;  # show status bar
            _FXSortFoldersFirst = true;  # keep folders on top when sorting by name
            FXDefaultSearchScope = "SCcf";  # when performing a search, search in the current folder
            FXPreferredViewStyle = "clmv";  # use column view in all Finder windows by default
          };

          NSGlobalDomain = {
            "com.apple.trackpad.scaling" = 3.0;  # trackpad tracking speed (0.0 - 3.0), default = 1.0
            KeyRepeat = 3;  # minimum is 2 (30 ms), maximum is 120 (1800 ms)
            InitialKeyRepeat = 15;  # minimum is 15 (225 ms), maximum is 120 (1800 ms)          
            AppleShowAllFiles = true;  # show hidden files
            NSDocumentSaveNewDocumentsToCloud = false;  # home directory is opened in the fileviewer dialog when saving a new document instead of iCloud
            AppleFontSmoothing = 1;  # enable subpixel font rendering on non-Apple LCDs

            NSAutomaticCapitalizationEnabled = false;  # disable auto capitalization
            NSAutomaticDashSubstitutionEnabled = false;  # disable auto dash substitution
            NSAutomaticPeriodSubstitutionEnabled = false;  # disable auto period substitution
            NSAutomaticQuoteSubstitutionEnabled = false;  # disable auto quote substitution
            NSAutomaticSpellingCorrectionEnabled = false;  # disable auto spelling correction

            # Expand save panel by default
            NSNavPanelExpandedStateForSaveMode2 = true;           
            NSNavPanelExpandedStateForSaveMode = true;

            # Expand print panel by default
            PMPrintingExpandedStateForPrint = true;
            PMPrintingExpandedStateForPrint2 = true;
          };

          trackpad = {
            Clicking = true;  # enable tap to click
            TrackpadThreeFingerDrag = true;  # enable three finger drag
          };

          
          ActivityMonitor.ShowCategory = 100;  # show all processes
          
          # Customize settings that not supported by nix-darwin directly
          # see the source code of this project to get more undocumented options:
          #    https://github.com/rgcr/m-cli
          # 
          # All custom entries can be found by running `defaults read` command.
          # or `defaults read xxx` to read a specific domain.
          CustomUserPreferences = {
            "~/Library/Preferences/ByHost/com.apple.controlcenter.plist" = {
              "Bluetooth" = 18;  # show bluetooth icon in menu bar
              "BatteryShowPercentage" = 1;  # battery show percentage
            };
          };
        };
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."Vladimirs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Vladimirs-MacBook-Air".pkgs;
  };
}
#!/bin/bash

echo "Changing macOS settings..."

# Ask for the administrator password upfront
sudo -v


###############################################################################
# Privacy & Security                                                          #
###############################################################################

# # Disable remote login
sudo systemsetup -f -setremotelogin off > /dev/null

# Limit ad tracking
defaults write com.apple.AdLib forceLimitAdTracking -bool true
defaults write com.apple.AdLib personalizedAdsMigrated -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib AD_DEVICE_IDFA -string '00000000-0000-0000-0000-000000000000'

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable geocode suggestions
defaults write com.apple.suggestions SuggestionsAllowGeocode -bool false

# Disable Siri suggestions
defaults write com.apple.suggestions AppCanShowSiriSuggestionsBlacklist -array \
  "com.apple.AppStore" \
  "com.apple.iCal" \
  "com.apple.AddressBook" \
  "com.apple.FaceTime" \
  "com.apple.mail" \
  "com.apple.Maps" \
  "com.apple.iChat" \
  "com.apple.MobileSMS" \
  "com.apple.news" \
  "com.apple.Notes" \
  "com.apple.Photos" \
  "com.apple.podcasts" \
  "com.apple.reminders" \
  "com.apple.Safari"

# Disable Siri analytics
defaults write com.apple.suggestions SiriCanLearnFromAppBlacklist -array \
  "com.apple.AppStore" \
  "com.apple.iCal" \
  "com.apple.AddressBook" \
  "com.apple.FaceTime" \
  "com.apple.mail" \
  "com.apple.Maps" \
  "com.apple.iChat" \
  "com.apple.MobileSMS" \
  "com.apple.news" \
  "com.apple.Notes" \
  "com.apple.Photos" \
  "com.apple.podcasts" \
  "com.apple.reminders" \
  "com.apple.Safari"

# Disable Ask Siri (System Preferences > Siri > Uncheck "Enable Ask Siri")
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# Hide Siri in menu bar
defaults write com.apple.siri StatusMenuVisible -bool false

# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on > /dev/null

# Enable stealth mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on > /dev/null

# Home directory is opened in the fileviewer dialog when saving a new document instead of iCloud Documents
# defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

###############################################################################
# Trackpad, mouse, keyboard                                                   #
###############################################################################

# Trackpad tracking speed
defaults write -g com.apple.trackpad.scaling -float 3

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
# defaults write -g AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
# defaults write -g ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate, and make it happen more quickly.
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

###############################################################################
# Display                                                                     #
###############################################################################

# Enable subpixel font rendering on non-Apple LCDs
# defaults write -g AppleFontSmoothing -int 1

###############################################################################
# Input check                                                                 #
###############################################################################

# Disable automatic capitalization as it’s annoying when typing code
defaults write -g NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# General Tweaks                                                              #
###############################################################################

# Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Show remaining battery percentage
defaults write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Show Bluetooth icon in menu bar
defaults write com.apple.controlcenter.plist Bluetooth -int 18

# Set menubar digital clock format
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# Change default location for screenshots
mkdir -p $HOME/screenshots
defaults write com.apple.screencapture location -string "$HOME/screenshots"

# Disable the startup chime on boot
sudo nvram StartupMute=%01

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Increase window resize speed for Cocoa applications
defaults write -g NSWindowResizeTime -float 0.001

# Always show scrollbars
defaults write -g AppleShowScrollBars -string "Always"

###############################################################################
# Finder                                                                      #
###############################################################################

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show tab bar
# defaults write com.apple.finder ShowTabView -bool true

# Don't show recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfVo"

# Don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Show all filename extensions
defaults write -g AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show path bar in the bottom of the Finder windows
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in the bottom of the Finder windows
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write -g com.apple.springing.enabled -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library 2>/dev/null

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand file Info panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  MetaData -bool true \
  Name -bool true \
  OpenWith -bool true \
  Privileges -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Put the Dock on the left of the screen
defaults write com.apple.dock "orientation" -string "left"

# Autohide the Dock when the mouse is out
defaults write com.apple.dock "autohide" -bool "true"

# Remove the Dock autohide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"

# Remove the autohide delay, the Dock appears instantly
defaults write com.apple.dock "autohide-delay" -float "0"

# Set the icon size of Dock items to 42 pixels
defaults write com.apple.dock tilesize -int 42

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Remove all apps from Dock
defaults write com.apple.dock persistent-apps -array

###############################################################################
# Applications                                                                #
###############################################################################

# Activity Monitor: Show the main window when launching
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Activity Monitor: Visualize CPU usage in the Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Activity Monitor: Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Photos: Prevent from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Time Machine: Prevent prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


printf "Done. Some of these changes require a restart to take effect.\n"

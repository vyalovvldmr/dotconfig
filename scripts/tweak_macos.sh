#!/bin/bash

echo -e "\n\nChanging macOS settings"
echo "=============================="
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# Privacy & Security                                                          #
###############################################################################

# # Disable remote login
sudo systemsetup -f -setremotelogin off > /dev/null

# # Enable automatic software update checks
softwareupdate --schedule on

# # Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

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
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Disable handoff between Mac and nearby iCloud devices
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false

# Disable Gatekeeper (the “Are you sure you want to open this application?” dialog)
sudo spctl --master-disable
defaults write com.apple.LaunchServices LSQuarantine -bool false

###############################################################################
# Trackpad, mouse, keyboard                                                   #
###############################################################################

# Trackpad tracking speed
defaults write -g com.apple.trackpad.scaling -float 2

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write -g AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Turn on App Expose
defaults write -g showAppExposeGestureEnabled -bool true

# Set a blazingly fast keyboard repeat rate, and make it happen more quickly.
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Enable trackpad three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults -currentHost write -g com.apple.trackpad.threeFingerDragGesture -bool true
defaults write -g com.apple.trackpad.threeFingerDragGesture -bool true

# Disable lookup & data detectors (three finger tap)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -bool false
defaults -currentHost write -g com.apple.trackpad.threeFingerTapGesture -bool false
defaults write -g com.apple.trackpad.threeFingerTapGesture -bool false

###############################################################################
# Display & Power                                                             #
###############################################################################

# Sleep the display after 5 minutes
sudo pmset -a displaysleep 5

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 20 minutes on battery
sudo pmset -b sleep 20

# Hibernation mode
# 0:  Disable hibernation (speeds up entering sleep mode)
# 3:  Copy RAM to disk so the system state can still be restored in case of a
#     power failure.
# 25: Hibernation mode
sudo pmset -a hibernatemode 3

# Enable subpixel font rendering on non-Apple LCDs
defaults write -g AppleFontSmoothing -int 1

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
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Show remaining battery percentage
defaults write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Show Bluetooth icon in menu bar
defaults write com.apple.controlcenter.plist Bluetooth -int 18

# Set menubar digital clock format
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# Jump to the spot that's clicked in scroll bar
defaults write -g AppleScrollerPagingBehavior -int 1

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# Change default location for screenshots
mkdir $HOME/screenshots
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

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show tab bar
defaults write com.apple.finder ShowTabView -bool true

# Show preview pane
defaults write com.apple.finder ShowPreviewPane -bool true
defaults write com.apple.finder PreviewPaneWidth -int 172

# Set sidebar width
defaults write com.apple.finder SidebarWidth -int 172

# Don't show recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set root / as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfVo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///"

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

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library 2>/dev/null

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Put the Dock on the left of the screen
defaults write com.apple.dock "orientation" -string "left"

# Autohide the Dock when the mouse is out (Turned off)
defaults write com.apple.dock "autohide" -bool "false"

# Remove the Dock autohide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"

# Remove the autohide delay, the Dock appears instantly
defaults write com.apple.dock "autohide-delay" -float "0"

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
# defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Remove all apps from Dock
defaults write com.apple.dock persistent-apps -array

###############################################################################
# Safari                                                                      #
###############################################################################

# Hide first-time launch prompts on start page
defaults write com.apple.Safari HideHighlightsEmptyItemViewPreferenceKey -bool true
defaults write com.apple.Safari HideStartPageFrecentsEmptyItemView -bool true
defaults write com.apple.Safari HideStartPageSiriSuggestionsEmptyItemView -bool true

# Do not prompt user to make Safari their default browser
defaults write com.apple.Safari DefaultBrowserPromptingState3 -int 4

# Disable widgets on start page
defaults write com.apple.Safari ShowBackgroundImageInFavorites -bool false
defaults write com.apple.Safari ShowFavorites -bool false
defaults write com.apple.Safari ShowFrequentlyVisitedSites -bool false
defaults write com.apple.Safari ShowHighlightsInFavorites -bool false
defaults write com.apple.Safari ShowPrivacyReportInFavorites -bool false
defaults write com.apple.Safari ShowReadingListInFavorites -bool false

# Do not always restore sessions at launch and do not restore private windows
# (Preferences > General > Safari opens with > A new private window)
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write com.apple.Safari ExcludePrivateWindowWhenRestoringSessionAtLaunch -bool true
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool true

# Set Safari’s home page to `about:blank` for faster loading
# (Preferences > General > Homepage > about:blank)
defaults write com.apple.Safari HomePage -string "about:blank"

# Do not open "safe" files automatically after download
# (Preferences > General > Open "safe" files after downloading)
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disable autofill contacts, usernames/passwords, credit cards, and form data
# (Preferences > AutoFill)
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Set search engine to DuckDuckGo
# (Preferences > Search > Search engine > DuckDuckGo)
defaults write com.apple.Safari SearchProviderShortName -string DuckDuckGo

# Disable search engine suggestions
# (Preferences > Search > Include search engine suggestions)
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Disable website-specific search
# (Preferences > Search > Enable Quick Website Search)
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false

# Disable preloading
# (Preferences > Search > Preload Top Hit in the background)
defaults write com.apple.Safari PreloadTopHit -bool false

# Disable favorites in the search bar
# (Preferences > Search > Show Favorites)
defaults write com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false

# Disable safe search (sends data to Google Safe Browsing)
# (Preferences > Security)
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool false

# Disable click tracking for ads
# (Preferences > Privacy > Allow privacy-preserving measurement of ad effectiveness)
defaults write com.apple.Safari WebKitPreferences.privateClickMeasurementEnabled -bool false

# Show the full URL in the address bar
# (Preferences > Advanced > Show full website address)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set default encoding to UTF-8
# (Preferences > Advanced > Default encoding > Unicode (UTF-8))
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string "utf-8"
defaults write com.apple.Safari WebKitPreferences.defaultTextEncodingName -string "utf-8"

# Show develop menubar option
# (Preferences > Advanced > Show Develop menu in menu bar)
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitPreferences.developerExtrasEnabled -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

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

## https://someonewhocares.org/hosts/zero/
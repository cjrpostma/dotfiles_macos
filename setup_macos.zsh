#!/usr/bin/env zsh

echo "\n<<< Starting macOS Setup >>>\n"

osascript -e 'tell application "System Preferences" to quit'

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > Preferences > General > New Finder windows show:
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/.dotfiles"
defaults write com.apple.Finder AppleShowAllFiles true

# System Preferences > Keyboard
defaults write -g KeyRepeat -int 1.15
defaults write -g InitialKeyRepeat -int 12

# System Preferences > Dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 45
defaults write com.apple.dock largesize -int 60
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.25
defaults write com.apple.dock autohide-delay -float 0.1

# Third-Party Software

# iTerm2 Settings
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.dotfiles/iterm2"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true

# Finish macOS Setup
killall Finder
killall Dock
echo "\n<<< macOS Setup Complete.
    A logout or restart might be necessary. >>>\n"

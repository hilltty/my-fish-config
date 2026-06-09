# Fish Shell Configuration

Fish shell functions for system management tasks.

## Installation
```fish
git clone https://github.com/hilltty/my-fish-config.git
cd my-fish-config
cp completions/*.fish ~/.config/fish/completions/
cp functions/*.fish ~/.config/fish/functions/
source ~/.config/fish/config.fish
```

## Modules

### zerotier

Manages [ZeroTier](https://github.com/zerotier/ZeroTierOne) service and network routing parameters.

**Commands:**
```fish
zerotier on          # Start service
zerotier off         # Stop service
zerotier switch      # Toggle proxy mode
zerotier status      # Show status
```

### spicetify-apply

Applies [Spicetify](https://spicetify.app/) customizations to Spotify.
 
**Commands:**
```fish
spicetify-apply       # Apply Spicetify
spicetify-apply -v    # Verbose mode
```
 
**Configuration:**
 
`spotify_path` at the top of the function defaults to the system-level Flatpak path:
```
/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
```
 
For user-level Flatpak installations, change it to:
```
~/.local/share/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
```

## License

MIT
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

Applies [Spicetify](https://spicetify.app/) customizations to Spotify ([negativo17](https://negativo17.org/spotify-client/) version).

**Commands:**
```fish
spicetify-apply      # Set permissions, update, restore, and apply
```

## License

MIT
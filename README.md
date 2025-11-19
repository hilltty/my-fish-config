# Fish Shell Configuration

Fish shell functions for system management tasks.

## Installation
```bash
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
zerotier restart     # Restart service
zerotier switch      # Toggle proxy mode
zerotier status      # Show status
```

## License

MIT

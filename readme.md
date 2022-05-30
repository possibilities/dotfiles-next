# Dotfiles

A brutally minimal work environment

## Usage

Use preseed file with Debian 11.3.0 ISO by pressing `<ESC>` when installer starts

```
auto url=https://raw.githubusercontent.com/possibilities/dotfiles-next/main/preseed.cfg
```

Install everything

```
wget -O - https://raw.githubusercontent.com/possibilities/dotfiles-next/main/bootstrap-system.sh | sh
```

Install dotfiles only (after bootstrap)

```
cd ~/code/dotfiles
./install-dotfiles.sh
```

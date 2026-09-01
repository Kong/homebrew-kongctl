# Kong kongctl

## Installation

Install the source-built formula:

```shell
brew install --formula kong/kongctl/kongctl
```

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "kong/kongctl"
brew "kongctl"
```

## Migrating from the cask

The cask is deprecated but will continue receiving releases until Homebrew
disables it on February 28, 2027. Existing cask users can migrate with:

```shell
brew uninstall --cask kongctl
brew install --formula kong/kongctl/kongctl
```

Ordinary cask uninstall preserves kongctl configuration and authentication
data. Do not use `--zap` for this migration.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

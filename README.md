# Kong kongctl

## Installation

Install the prebuilt cask:

```shell
brew install --cask kong/kongctl/kongctl
```

Alternatively, install the formula. Homebrew downloads a prebuilt bottle for
supported macOS and Linux platforms, so Go is not needed for a normal install:

```shell
brew install --formula kong/kongctl/kongctl
```

If a bottle is unavailable or `--build-from-source` is requested, Homebrew
builds the formula locally and installs Go as a build dependency.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "kong/kongctl"
brew "kongctl"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

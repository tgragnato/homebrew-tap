
# tgragnato/homebrew-tap

This is a custom Homebrew tap designed to provide access to formulae and software  that are not available in the official Homebrew repositories.

Currently, this tap is being used for:

-	Compiling a fork of aMule with opinionated patches that cannot be distributed upstream.
-	Building an updated version of Terraform, which Homebrew has declined to integrate due to license changes.
-	Installing Jekyll on the system without manual intervention via bundle and gem.
-	Distributing Magnetico, an autonomous (self-hosted) BitTorrent DHT search engine suite.

## Usage

### Prerequisites

- On macOS, install Xcode Command Line Utilities:

```zsh
xcode-select --install
```

- On Linux, install cURL and Git:

```bash
# Using APT
sudo apt-get install -y curl git

# Using Yum
sudo yum install -y curl git
```

- Install Homebrew:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

- If previously installed, update homebrew and the formulae:

```zsh
brew update
```

### Add this tap

Fetch the formulae in this tap:

```zsh
brew tap tgragnato/tap
```

## How do I install these formulae?

```zsh
brew install tgragnato/tap/amule
brew install tgragnato/tap/crypto++
brew install tgragnato/tap/jekyll
brew install tgragnato/tap/magnetico
brew install tgragnato/tap/terraform
```

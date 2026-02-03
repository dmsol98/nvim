# Linux Installation

Install Neovim and dependencies using Homebrew.

```bash
brew install neovim tree-sitter lua-language-server pyright ruff llvm ripgrep
```

Clone this repo into `~/.config/nvim` using SSH.

```bash
git clone git@github.com:diegosol127/nvim.git ~/.config/nvim
```

# Windows Installation

Install the Chocolatey package manager for simplicity. The docs can be found [here](https://docs.chocolatey.org/en-us/choco/setup/). Enter the following command into an administrative `pwsh` prompt.
```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Install Neovim and dependencies using Chocolately (admin privileges required).

```pwsh
choco install mingw make neovim tree-sitter lua-language-server pylance llvm ripgrep
```

Clone this repo into `%LOCALAPPDATA%/nvim` using SSH.

```pwsh
git clone git@github.com:diegosol127/nvim.git $env:LOCALAPPDATA\nvim
```

It is important to make sure that `make` installed and recognized as a system call to build components of telescope. If `telescope-fzf-native` fails to build with `Lazy`, you can build it yourself.

```pwsh
cd $env:LOCALAPPDATA\nvim-data\lazy\telescope-fzf-native.nvim
make
```

# To Do

### LSP Updates
- [ ] Add LSP for Bash
- [x] Add LSP for C
- [x] Add LSP for C++
- [ ] Add LSP for CMake
- [x] Add LSP for Python

### Plugins
- [x] Whichkey
- [x] FTerm
- [x] Oil

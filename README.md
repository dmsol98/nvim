# Linux Installation

Install neovim and dependencies using Homebrew.
```bash
brew install neovim tree-sitter lua-language-server
```

**_Note_:** `brew install tree-sitter-cli` may only be needed for Latex 

Clone this repo into `~/.config/nvim` using SSH.
```bash
git clone git@github.com:diegosol127/nvim.git ~/.config/nvim
```

# Windows Installation

Install the Chocolatey package manager for simplicity. The docs can be found [here](https://docs.chocolatey.org/en-us/choco/setup/). Enter the following command into an administrative pwsh prompt.
```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Install neovim and dependencies using Chocolately (admin priviliges required).

```pwsh
choco install mingw neovim tree-sitter lua-language-server
```

Clone this repo into `%LOCALAPPDATA%/nvim` using SSH.

```pwsh
git clone git@github.com:diegosol127/nvim.git $env:LOCALAPPDATA/nvim
```

# To Do

- [x] automatically set wrap for markdown files
- [x] error detection
- [x] lsp integration
- [x] autocomplete

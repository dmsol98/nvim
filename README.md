# Linux Installation
Personalized NeoVim configuration

Treesitter requirements
```zsh
brew install nvim
```

**_Note_:** `tree-sitter-cli` may only be needed for Latex 

# Windows Installation

Install the Chocolatey package manager for simplicity. The docs can be found [here](https://docs.chocolatey.org/en-us/choco/setup/). Enter the following command in an administrative pwsh prompt.
```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Install neovim and dependencies

```pwsh
choco install neovim mingw
```

Clone this repo in the `%LOCALAPPDATA%` folder in Windows using SSH.

```pwsh
cd $env:LOCALAPPDATA
git clone git@github.com:diegosol127/nvim.git nvim
```

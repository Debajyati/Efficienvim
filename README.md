# Efficienvim - A Highly Efficient & Multifaceted Neovim Starter Configuration entirely in lua with Lazy.nvim

Note: This is only a starter configuration to get started with Neovim with Efficiency & Enjoyment. 
After installation, you should remove the `.git` folder so that you can add your own repo later and fully customise(ricing) your Neovim on your own liking & preferences.

## 👀 Requirements

- Make sure you know some basic vim commands.
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://docs.astronvim.com/Recipes/icons))
- [Neovim 0.9+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>ps`)
  - [lazygit](https://github.com/jesseduffield/lazygit) - lazygit ui toggle inside NeoVim (`:LazyGit`)

## 🛠️ Installation
Efficienvim currently supports better on MacOS, Linux & WSL
If you use Windows then installing in WSL is Recommended.

### Linux/Mac OS/WSL (Unix)

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the repository

```bash
git clone --depth 1 https://github.com/Debajyati/Efficienvim ~/.config/nvim
nvim
```

### Windows (Powershell Core or Windows Powershell only. Don't use Command prompt.)

#### Make a backup of your current nvim and nvim-data folder

```pwsh
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

#### Clone the repository

```pwsh
git clone --depth 1 https://github.com/Debajyati/Efficienvim $env:LOCALAPPDATA\nvim
nvim
```
### Tip
Always run `:checkhealth` after any configuration changes to diagnose any problem with the configuration (if any) so that necessary steps can be taken. 

## 👨🏽‍💻 Initial Setup

#### Install Preferred LSP

Enter `:LspInstall` or `:MasonInstall` followed by the name of the server you want to install<br>
Example: `:LspInstall clangd` or `:MasonInstall clangd` for C/C++

#### Install Treesitter(language parser in simple words)

Enter `:TSInstall` followed by the name of the language you want to install<br>
Example: `:TSInstall c` for c language

#### Debugger Support

Efficienvim won't come with DAP(Debug Adapter Protocol). 
If you want debugging support you would need to install [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) & [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui) first with lazy.nvim(the plugin manager Efficienvim uses) or any other plugin that gives debugger support in Neovim.

#### How to Manage Installed plugins?

Run `:Lazy` to open the Lazy.nvim ui(A graphical status window)

Run `:Lazy check` to check for plugin updates

Run `:Lazy update` to apply any pending plugin updates

Run `:Lazy clean` to remove any disabled or unused plugins

Run `:Lazy sync` to update and clean plugins

Run `:h Lazy` for more info.

#### How to Manage Installed LSPs

- `:Mason` - opens a graphical status window

- `:MasonUpdate` - updates all managed registries

- `:MasonInstall <package> ...` - installs/re-installs the provided packages

- `:MasonUninstall <package> ...` - uninstalls the provided packages

- `:MasonUninstallAll` - uninstalls all packages

- `:MasonLog` - opens the mason.nvim log file in a new tab window

Run `:h Mason` for more info.

### Credits ✨

Kudos to the entire neovim community out there, all the plugin authors & the following repositories that helped me learn to develop this starter configuration.
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [NVChad](https://github.com/NvChad/NvChad)
- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [LazyVim](https://github.com/LazyVim/LazyVim)

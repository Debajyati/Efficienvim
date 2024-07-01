# Efficienvim - A Highly Efficient & Multifaceted Neovim Starter Configuration entirely in lua with Lazy.nvim
![Efficienvim Dashboard](https://github.com/Debajyati/Efficienvim/blob/main/Dashboard.png)

Note: This is only a starter configuration to get started with Neovim with Efficiency & Enjoyment. 
After installation, you should remove the `.git` folder so that you can add your own repo later and fully customise(ricing) your Neovim on your own liking & preferences.

## 👀 Requirements

- Make sure you know some basic vim commands.
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Neovim 0.9+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- gcc (GNU C Compiler)
- node.js
- [glow](https://github.com/charmbracelet/glow#installation) for markdown previews
- [lf](https://github.com/gokcehan/lf) for using lf(terminal emulated file manager written in go) to navigate and preview files within Neovim. This stands for an alternative approach to using telescope, nvim-tree or Oil.nvim. Free to use any one of these tools at a moment. 
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
  - `xclip` is recommended for WSL users. 
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>ps`)
  - [lazygit](https://github.com/jesseduffield/lazygit) - lazygit ui toggle inside NeoVim (`:LazyGit`)
  
### Note
- The leader key is set as `<space>` key in the `keymaps.lua` file which loads and should always load after all the plugins are loaded. 
So make sure when customising the configuration further, you don't set any keybinding involving the `<leader>` key in `lazy.lua`(which loads all the plugins).
- Efficienvim has two versions. 
    - The `main` branch is the **default** one that's the *ordinary*(user-friendlier) version.
      It uses `Neotree` plugin as its file-explorer(which is auto-opened at the left-side of the Neovim window at startup) instead of the `Netrw` file-exlorer that comes with Neovim. 
      It doesn't have any **dashboard**.
    - The `enhanced` branch is the more **advanced** (with more plugins as *enhanced* features) version.
      It uses `Oil.nvim` plugin as its file-explorer(you will be able to edit the file system like a regular buffer) when you enter in Neovim through `nvim .`.
      It has a beautiful **dashboard** which opens at startup. 

## 🛠️ Installation
Efficienvim is supported better on MacOS, Linux & WSL.
If you use Windows then installing in WSL is Recommended.

### Linux/Mac OS/WSL (Unix)

#### Make a backup of your current nvim and shared folder

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the repository
##### Complete Installation(Both branches, both versions)
```bash
git clone https://github.com/Debajyati/Efficienvim ~/.config/nvim
nvim
```

##### Seperate Installation(Installing a specific version/branch)
```bash
git clone -b main --single-branch https://github.com/Debajyati/Efficienvim ~/.config/nvim # Installing the only the ordinary version (branchname - 'main')
nvim
```
Or,
```bash
git clone -b enhanced --single-branch https://github.com/Debajyati/Efficienvim ~/.config/nvim # Installing the only the enhanced version (branchname - 'enhanced')
nvim
```

### Windows (Powershell Core or Windows Powershell only. Don't use Command prompt.)

#### Make a backup of your current nvim and nvim-data folder

```sh
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

#### Clone the repository
##### Complete Installation(Both branches, both versions)
```sh
git clone https://github.com/Debajyati/Efficienvim $env:LOCALAPPDATA\nvim
nvim
```
##### Seperate Installation(Installing a specific version/branch)
```sh
git clone -b main --single-branch https://github.com/Debajyati/Efficienvim $env:LOCALAPPDATA\nvim # Installing the only the ordinary version (branchname - 'main')
nvim
```
Or,
```sh
git clone -b enhanced --single-branch https://github.com/Debajyati/Efficienvim $env:LOCALAPPDATA\nvim # Installing the only the enhanced version (branchname - 'enhanced')
nvim
```
### Tip
Always run `:checkhealth` after any configuration changes to diagnose any problem with the configuration (if any) so that necessary steps can be taken. 

## 👨🏽‍💻 Initial Setup

#### Install Preferred LSP

Enter `:LspInstall` or `:MasonInstall` followed by the name of the server you want to install<br>
Example: `:LspInstall clangd` or `:MasonInstall clangd` for C/C++

#### Install Treesitter(language parser in simple words, which enables better syntax highlighting)

Enter `:TSInstall` followed by the name of the language you want to install<br>
Example: `:TSInstall c` for c language

#### Debugger Support

Efficienvim won't come with DAP(Debug Adapter Protocol). 
If you want debugging support you would need to install [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) & [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui) first with lazy.nvim(the plugin manager Efficienvim uses) or any other plugin that gives debugger support in Neovim.

### How to Manage Installed plugins?

- `:Lazy` - opens the Lazy.nvim ui(A graphical status window)

- `:Lazy check` - checks for plugin updates

- `:Lazy update` - applies any pending plugin updates

- `:Lazy clean` - removes any disabled or unused plugins

- `:Lazy sync` - updates and clean plugins

Run `:h Lazy` for more info.

### How to Manage Installed LSPs

- `:Mason` - opens a graphical status window

- `:MasonUpdate` - updates all managed registries

- `:MasonInstall <package> ...` - installs/re-installs the provided packages

- `:MasonUninstall <package> ...` - uninstalls the provided packages

- `:MasonUninstallAll` - uninstalls all packages

- `:MasonLog` - opens the mason.nvim log file in a new tab window

Run `:h Mason` for more info.

### Tree Structure of the Configuration Files
```md
  .
  ├── init.lua
  ├── lazy-lock.json
  └── lua
      └── config  
          ├── autocmds.lua        
          ├── keymaps.lua        
          ├── lazy.lua        
          ├── lspsettings.lua
          ├── noicesettings.lua
          └── options.lua
```
### About FileSystem Plugins
Total 4 plugins are there for previewing and navigating files. `Nvim-tree`, `Oil.nvim`, `lf.vim` and `Telescope.nvim` .
Oil.nvim only is auto triggered when you open a project folder by running `nvim .` instead of just `nvim` in the terminal.
| FileSystem Plugin | Must Know Command | Keymaps |
|:-----------------:|:-------:|:------:|                 
| Oil.nvim  | `:Oil` | `<space>o` |
| Nvim-tree | `:NvimTreeToggle` | `<space>e`,`<space>E` etc. |
| Telescope.nvim | `:Telescope` | `<space>ff`, `<space>gf`, `<space>ps` etc. |
| lf.vim | `:Lf` | `<space>lf` |
## Credits ✨

Kudos to the entire neovim community out there, all the plugin authors & the following repositories that made me know, how to develop this starter configuration.
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [NVChad](https://github.com/NvChad/NvChad)
- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [LazyVim](https://github.com/LazyVim/LazyVim)

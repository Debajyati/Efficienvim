# ![Efficienvim Dashboard](https://github.com/Debajyati/Efficienvim/blob/main/Dashboard.png)

> [!WARNING]
> Efficienvim is no longer actively maintained.
> The actively maintained faster and lighter starter config template is now **Efficienvchad**.
> Head over to [Efficienvchad](https://github.com/Debajyati/Efficienvchad) to know more.


Note: This is only a starter configuration to get started with Neovim with Efficiency & Enjoyment. 
After installation, you should remove the `.git` folder so that you can add your own repo later and fully customise(ricing) your Neovim on your own liking & preferences.

## 👀 Requirements

- Make sure you know some basic vim commands.
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Neovim 0.10 or above (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- gcc (GNU C Compiler)
- node.js
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
  - `xclip` is recommended for WSL users. 
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>ps`)
  - [lazygit](https://github.com/jesseduffield/lazygit) - lazygit ui toggle inside NeoVim (`:LazyGit`)
### Note
Efficienvim is available in two different versions. 
  - The `main` branch is the **default** one that's the *ordinary* ***(easy to rewrite)*** version. 
      It is the branch you are looking for if you want to get config as template and customise in beast mode based on your specific needs. 
      It uses `Neotree` plugin as its file-explorer(which is auto-opened at the left-side of the Neovim window at startup) instead of the `Netrw` file-explorer that comes with Neovim. 
      It doesn't have any **dashboard** that comes up start up.
  - The `enhanced` branch is the more **advanced** (with more plugins as *better* features) and ***(user-friendlier)*** version.
      It uses `Oil.nvim` (you will be able to edit the file system like a regular buffer) and `Nvim-tree` plugins as its file-explorers.
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

## Enhanced Branch Showcases
### Efficienvim Dashboard in transparent/translucent terminal
![image](https://github.com/user-attachments/assets/2df17d44-05d5-4972-9197-1bfe07215f4d)

### Lazy.nvim UI with Rounded Borders
![image](https://github.com/user-attachments/assets/e0657360-59e8-4525-b330-cfd2f68c89ce)

### Telescope Find Files
https://github.com/user-attachments/assets/977a1170-e8ff-4c84-9312-0d7946163995

### Calling `lf` within neovim
https://github.com/user-attachments/assets/d5cfbcd6-1a1f-4c2d-80bb-2d8fe5dcbb2f

### Using Oil.nvim
https://github.com/user-attachments/assets/92b218bf-3bf6-4b3b-8b10-592ca24fb719

### Telescope Git Files
https://github.com/user-attachments/assets/4211acd5-d5b7-4029-9750-9e41a438bbe7

### Nvim-tree as File Explorer Sidebar and Toggleterm as Terminal
![Screenshot 2024-09-24 230223](https://github.com/user-attachments/assets/98ca220b-083f-4dbf-9735-58a8a3a1b45a)

### Changing Colorschemes with Live Preview
https://github.com/user-attachments/assets/e08a659e-7fc9-46c8-bc0c-2a17798a5329

### cmp window with borders for getting windows better distinguishable
![cmp window with borders](https://github.com/user-attachments/assets/c146f91f-b331-44cd-ba02-e2e12813d396)

### cmdline completion
![image](https://github.com/user-attachments/assets/ec476b05-8399-4372-860c-0be133be5a8f)


## Credits ✨

Kudos to the entire neovim community out there, all the plugin authors & the following repositories that made me know, how to properly configure Neovim.
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [NVChad](https://github.com/NvChad/NvChad)
- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [ThePrimeagen](https://github.com/ThePrimeagen/init.lua)

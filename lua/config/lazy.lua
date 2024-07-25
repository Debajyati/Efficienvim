local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  -- using lazy to install lazy
  {
    "folke/lazy.nvim",
    lazy = false,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
    end,
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      -- {
      --   "j-hui/fidget.nvim", -- Useful status updates for LSP
      --   config = function()
      --     require("fidget").setup {
      --       sources = { -- Sources to configure
      --         jdtls = { -- Name of source
      --           ignore = true, -- Ignore notifications from this source
      --         },
      --       },
      --     }
      --   end,
      -- },
      {
        "williamboman/mason.nvim",
        cmd = {
          "Mason",
          "MasonInstall",
          "MasonUninstall",
          "MasonUninstallAll",
          "MasonLog",
        }, -- Package Manager
        dependencies = "williamboman/mason-lspconfig.nvim",
        config = function()
          local mason = require("mason")
          local mason_lspconfig = require("mason-lspconfig")
          local lspconfig = require("lspconfig")

          require("lspconfig.ui.windows").default_options.border = "rounded"


          mason.setup({
            ui = {
              -- Whether to automatically check for new versions when opening the :Mason window.
              check_outdated_packages_on_open = false,
              border = "single",
              icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "󰚌",
              },
            },
          })

          mason_lspconfig.setup_handlers({
            function(server_name)
              if server_name ~= "jdtls" then
                local opts = {}

                local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
                if require_ok then
                  opts = vim.tbl_deep_extend("force", server, opts)
                end

                lspconfig[server_name].setup(opts)
              end
            end,
          })
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "go", "java" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = true, },
        indent = { enable = true },
      })
    end
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    -- enabled = false,
    config = function()
      require("Comment").setup({
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = '<leader>/',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = '<leader>/',
          ---Block-comment keymap
          block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil, --
      })
    end

  },
  {
    "hrsh7th/nvim-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter"
    },
    dependencies = {
      "hrsh7th/cmp-buffer",         -- Buffer Completions
      "hrsh7th/cmp-path",           -- Path Completions
      "saadparwaiz1/cmp_luasnip",   -- Snippet Completions
      "hrsh7th/cmp-nvim-lsp",       -- LSP Completions
      "hrsh7th/cmp-nvim-lua",       -- Lua Completions
      "hrsh7th/cmp-cmdline",        -- CommandLine Completions
      "L3MON4D3/LuaSnip",           -- Snippet Engine
      "rafamadriz/friendly-snippets", -- Bunch of Snippets
      "windwp/nvim-autopairs",      -- autopairs
      "onsails/lspkind.nvim",       -- vscode like pictograms
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/snipmate" }
      require("luasnip.loaders.from_vscode").lazy_load()
      -- require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/vscode" }

      local kind_icons = {
        Namespace = "󰌗",
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰆧",
        Constructor = "",
        Field = "󰜢",
        Private = "",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈚",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰊄",
        Table = "",
        Object = "󰅩",
        Tag = "",
        Array = "[]",
        Boolean = "",
        Number = "",
        Null = "󰟢",
        String = "󰉿",
        Calendar = "",
        Watch = "󰥔",
        Package = " ",
        Copilot = "",
        Codeium = "",
        TabNine = "",
        Supermaven = "",
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
          ---@diagnostic disable-next-line: missing-parameter
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          -- Abort auto completion
          ["<C-c>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
              "i",
              "s",
            }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
              "i",
              "s",
            }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        formatting = {
          -- fields = { 'abbr' },
          format = function(_, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        experimental = {
          ghost_text = true,
        },
      }

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
        formatting = {
          -- fields = { 'abbr' },
          format = function(_, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
      })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = "VeryLazy",
    -- enabled = false,
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0, -- Offset from pattern match
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
    end

  },

  {"mbbill/undotree", event="VeryLazy"},

  {"nvim-tree/nvim-web-devicons", lazy=true},
    -- This is only git plugin a user can need.
    -- Although I provided more after.
  {"tpope/vim-fugitive", event="VeryLazy"},

  {
    'akinsho/bufferline.nvim',
    -- enabled = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "BufWinEnter",
    config = function()
      local status_ok, bufferline = pcall(require, "bufferline")
      if not status_ok then return end
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              text = "EXPLORER",
              padding = 0,
              text_align = "center",
              highlight = "Offset",
            },
            {
              filetype = "NvimTree",
              text = "EXPLORER",
              padding = 0,
              text_align = "center",
              highlight = "Offset",
            },
          },
          -- buffer_close_icon = "",
          modified_icon = "●",
          -- close_icon = "",
          -- close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          max_name_length = 18,
          max_prefix_length = 15,     -- prefix used when a buffer is de-duplicated
          truncate_names = true,      -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics = "nvim_lsp",   -- | "nvim_lsp" | "coc",
          -- separator_style = "slant", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
          separator_style = { "", "" }, -- | "thick" | "thin" | { 'any', 'any' },
          indicator = {
            -- icon = " ",
            -- style = 'icon',
            -- style = "underline",
          },

          numbers = "none",                      -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
          -- close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
          left_mouse_command = "buffer %d",      -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil,            -- can be a string | function, see "Mouse actions"
          -- NOTE: this plugin is designed with this icon in mind,
          -- and so changing this is NOT recommended, this is intended
          -- as an escape hatch for people who cannot bear it for whatever reason
          buffer_close_icon = "",
          close_icon = '',
          left_trunc_marker = "",
          right_trunc_marker = "",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if count > 9 then return "9+" end
            return tostring(count)
          end,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          enforce_regular_tabs = false,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          -- can also be a table containing 2 custom separators
          -- [focused and unfocused]. eg: { '|', '|' }
          always_show_bufferline = true,
          sort_by = "insert_after_current",
          -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
          --   -- add custom logic
          --   return buffer_a.modified > buffer_b.modified
          -- end
          hover = {
            enabled = true,
            delay = 0,
            reveal = { "close" },
          },
        },
      })
      vim.cmd [[
            nnoremap <silent><TAB> :BufferLineCycleNext<CR>
            nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
            ]]
    end
  },

  {
    "akinsho/toggleterm.nvim",
    event="VeryLazy",
    config = function()
      local execs = {
        { nil, "<space>th", "Horizontal Terminal", "horizontal", 0.3 },
        { nil, "<space>tv", "Vertical Terminal", "vertical", 0.4 },
        { nil, "<space>tf", "Float Terminal", "float", nil },
      }

      local function get_buf_size()
        local cbuf = vim.api.nvim_get_current_buf()
        local bufinfo = vim.tbl_filter(function(buf)
          return buf.bufnr == cbuf
        end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
        if bufinfo == nil then
          return { width = -1, height = -1 }
        end
        return { width = bufinfo.width, height = bufinfo.height }
      end

      local function get_dynamic_terminal_size(direction, size)
        size = size
        if direction ~= "float" and tostring(size):find(".", 1, true) then
          size = math.min(size, 1.0)
          local buf_sizes = get_buf_size()
          local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
          return buf_size * size
        else
          return size
        end
      end

      local exec_toggle = function(opts)
        local Terminal = require("toggleterm.terminal").Terminal
        local term = Terminal:new { cmd = opts.cmd, count = opts.count, direction = opts.direction }
        term:toggle(opts.size, opts.direction)
      end

      local add_exec = function(opts)
        local binary = opts.cmd:match "(%S+)"
        if vim.fn.executable(binary) ~= 1 then
          vim.notify("Skipping configuring executable " .. binary .. ". Please make sure it is installed properly.")
          return
        end

        vim.keymap.set("n", opts.keymap, function()
          exec_toggle { cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size() }
        end, { desc = opts.label, noremap = true, silent = true })
      end

      for i, exec in pairs(execs) do
        local direction = exec[4]

        local opts = {
          cmd = exec[1] or vim.o.shell,
          keymap = exec[2],
          label = exec[3],
          count = i + 100,
          direction = direction,
          size = function()
            return get_dynamic_terminal_size(direction, exec[5])
          end,
        }

        add_exec(opts)
      end

      vim.cmd [[
          augroup terminal_setup | au!
          autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
          autocmd TermEnter * startinsert!
          augroup end
          ]]

      vim.api.nvim_create_autocmd({ "TermEnter" }, {
        pattern = { "*" },
        callback = function()
          vim.cmd "startinsert"
          _G.set_terminal_keymaps()
        end,
      })

      local opts = { noremap = true, silent = true }
      function _G.set_terminal_keymaps()
        vim.api.nvim_buf_set_keymap(0, "t", "<C-n><C-h>", [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-n><C-j>", [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-n><C-k>", [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-n><C-l>", [[<C-\><C-n><C-W>l]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-n>", [[<C-\><C-n>]], opts)
      end
    end
  },

  {"lunarvim/darkplus.nvim", event="VeryLazy"},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy=true },
-- sleek git integration
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event="VeryLazy",
  },
  -- for better neovim built-in lsp experience
  {
    'nvimdev/lspsaga.nvim',
    event = "VeryLazy",
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    },
  },
  -- a plugin, when triggered will show your beloved keybindings,
  -- so that you won't need to memorise them.
  -- needs to be configured properly to show what the keymaps do,
  -- otherwise it will show only the keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- follow this link - https://github.com/folke/which-key.nvim to know how to configure
      -- which-key based on your own and default plugins keybindings
      -- or leave it empty to use the default settings
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { 'terminal', "quickfix" },
                    },
            },
        })
        end,
      },
    },
    config = function ()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

      vim.keymap.set('n', "<space>e",':Neotree toggle<cr>', {desc = "file explorer tree toggle"})
    end
  },
      -- AI code completion with Codeium
  --[[ {
    "Exafunction/codeium.vim",
    event='BufEnter',
    config = function ()
      -- Changed '<C-g>' here to '<C-y>' to make it work.
      vim.keymap.set('i', '<C-y>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }, ]]
    -- ui for messages, commandline & the popupmenu
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
      options = {
        theme = "nord",
      },
    },
  },
  -- Better help with code diagnostics
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    cmd = { "TroubleToggle", "Trouble" },

    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, "Trouble")
    end,
  },

})



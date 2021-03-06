local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- LSP
        use {"neovim/nvim-lspconfig"}
        use {"glepnir/lspsaga.nvim", cmd = "Lspsaga"}
        use {"kabouzeid/nvim-lspinstall",
            cmd = "LspInstall",
            after = "nvim-lspconfig",
            config = function() require('lv-lspinstall') end
        }

        -- Telescope
        use {"nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            event = "BufReadPre",
            module = {"plenary.nvim", "popup.nvim"},
            config = function() require("lv-telescope") end,
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzy-native.nvim"},
            }
        }
		-- auto format
		use {"Chiel92/vim-autoformat",
            config = function()
				-- vim.g.formaterpath = {'/usr/bin/astyle'}
			    vim.g.autoformat_autoindent = 0
			    vim.g.autoformat_retab = 0
			    vim.g.autoformat_remove_trailing_spaces = 0

                vim.g.formatdef_my_custom_cs = '"astyle --mode=cs --style=ansi -pcHs4".&shiftwidth'
                vim.g.formatters_cs = {'my_custom_cs'}
			end
		}
		use {"sbdchd/neoformat"}

        -- Debugging
        use {"mfussenegger/nvim-dap"}

        -- Autocomplete
        use {"hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function() require("lv-compe") end
        }
        use {"hrsh7th/vim-vsnip", after = "nvim-compe"}
        use {"rafamadriz/friendly-snippets", after = "vim-vsnip"}

        -- centralize way to handle toggle quickfix location
        use {"folke/trouble.nvim", config = function() require("lv-trouble") end}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = "BufRead", config = function() require("lv-treesitter") end}
        use {"windwp/nvim-ts-autotag",
            ft = {'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'},
            config = function() require('nvim-ts-autotag').setup() end
        }

        -- Explorer
        use {"kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            event = {"VimEnter", "BufReadPre", "ColorScheme"},
            config = function() require('lv-nvimtree') end
        }

        -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
        use {"lewis6991/gitsigns.nvim",
            event = "BufReadPre",
            config = function() require("lv-gitsigns") end
        }
        use {"folke/which-key.nvim",
            event = {"VimEnter", "BufReadPre"},
            config = function() require('lv-which-key') end
        }
        use {"ChristianChiarulli/dashboard-nvim",
            event = "VimEnter",
            config = function() require('lv-dashboard') end
        }
        use {"windwp/nvim-autopairs",
            after = "nvim-treesitter",
            config = function() require("lv-autopairs") end
        }
        use {"terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function() require("lv-comment") end
        }
        use {"kevinhwang91/nvim-bqf", event = "BufReadPre"}

        -- Color
        use {"christianchiarulli/nvcode-color-schemes.vim", event = "VimEnter"}

        -- Status Line and Bufferline
        use {"glepnir/galaxyline.nvim",
            event = "VimEnter", config = function() require("lv-galaxyline") end
        }

        use {"romgrk/barbar.nvim",
            event = "VimEnter",
            config = function() require("lv-barbar") end,
            requires = {"kyazdani42/nvim-web-devicons", event = "ColorScheme"}
        }

        -- vim zoom in or out current windows.
        use {"markstory/vim-zoomwin"}

        use {"voldikss/vim-translator"}
        
        -- Highlight characters to move directly with f/t/F/T
        -- use {"deris/vim-shot-f"}

        -- When open some binary files, show in hex mode
        use {"fidian/hexmode",
            config = function()
                vim.g.hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.png,*.jpg,*.jpeg,*.gif,*.pdf'
            end
        }

        -- Draw a under line of cursor word
        use {"itchyny/vim-cursorword"}
        -- Interested word
        use {"lfv89/vim-interestingwords"}

        use {"psliwka/vim-smoothie"}

        use {"phaazon/hop.nvim"}

        use {"akinsho/nvim-toggleterm.lua", config = function() require("lv-terminal") end}
    end
)

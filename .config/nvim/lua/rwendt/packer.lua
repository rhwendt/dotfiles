local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- dracula theme
    use({
        "dracula/vim",
        as = "dracula",
        config = function()
            vim.cmd.colorscheme("dracula")
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/playground" })
    use({ "theprimeagen/harpoon" })
    use({ "Glench/Vim-Jinja2-Syntax" })
    use({ "mbbill/undotree" })
    use({ "tpope/vim-fugitive" })
    use({ "tpope/vim-commentary" })
    use({ "tpope/vim-surround" })
    use({ "christoomey/vim-tmux-navigator" })
    use({ "folke/neodev.nvim" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { { "kyazdani42/nvim-web-devicons", opt = true } },
    })
    -- linters/formatters
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- nvim-tree
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
    })
    use("nvim-tree/nvim-web-devicons")

    -- lsp
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "honza/vim-snippets" },
        },
    })
    if packer_bootstrap then
        require("packer").sync()
    end
end)

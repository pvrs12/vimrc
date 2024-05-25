-- install lazy.nvim - https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
    -- color scheme
    "cdmill/neomodern.nvim",
    -- comments
    "scrooloose/nerdcommenter",
    -- csv highlighting
    "chrisbra/csv.vim",
    -- show whitespace
    "chrisbra/vim-show-whitespace",
    -- git changes in the left gutter
    "lewis6991/gitsigns.nvim",
    -- todo comment highlighting
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- formatting
    "stevearc/conform.nvim",
    "pixelneo/vim-python-docstring",
    "hashivim/vim-terraform",
})

vim.cmd([[colorscheme neomodern]])
require("gitsigns").setup()
require("todo-comments").setup()
require("lualine").setup({
    options = { theme = "molokai" },
})
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

-- config python docstring
vim.g.python_style = "rest"
vim.cmd([[nnoremap <leader>ds :DocstringTypes<Enter>]])

vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.hls = true

vim.o.backspace = "indent,eol,start"

-- persistent undo - if the directory doesn't exist, make it
if not (vim.fn.has('macunix') == 0) then
  local undopath = "/tmp/.vim-undo-dir"
  if not (vim.uv or vim.loop).fs_stat(undopath) then
      vim.fn.system({
          "mkdir",
          undopath,
      })
  end
end

vim.o.undodir = undopath
vim.o.undofile = true

-- load page up/page down cursor fix
pageupdown_file = vim.fn.stdpath("config") .. "/fixpageupdown.vim"
vim.cmd("source " .. pageupdown_file)

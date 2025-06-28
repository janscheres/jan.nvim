local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
--vim.cmd [[packadd packer.nvim]]

return require('lazy').setup({
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  dependencies = {'nvim-lua/plenary.nvim'}
  },

  'AlexvZyl/nordic.nvim',

  {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
  },

  'ThePrimeagen/harpoon',

  'mbbill/undotree',

  'tpope/vim-fugitive',

  {'neoclide/coc.nvim', branch = 'master', build = 'yarn install --frozen-lockfile'},

  'rafcamlet/coc-nvim-lua',

  'ThePrimeagen/vim-be-good',
})

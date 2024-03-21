if vim.g.vscode then
    -- VSCode extension
    --there are better ways to do most of what is in settings.vim
    --leaving this around as an example of how to map a key from neovim back to vscode
   -- vim.cmd[[source $HOME/.config/nvim/vscode/settings.vim]]
    -- Optional plugin
        -- vim.cmd[[source $HOME/.config/nvim/vscode/easymotion-config.vim]]
end

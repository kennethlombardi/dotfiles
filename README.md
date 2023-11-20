# dotfiles

Run node against LinkDeep.js and links will be created between the root files and their counterparts in your home directory. For example system/.vimrc creates `~/.vimrc -> /path/to/dotfiles/root/.vimrc`

Depends on `stow` and `nodejs`

# experimental using Stow

`stow --target $HOME -v --stow root`

## stow will not stow the gitignore file

https://github.com/aspiers/stow/issues/75

> The point is that typically when stowing from a package which is a git repo, the .gitignore at the top of that repo is intended only for use within the git repo, and should not be stowed into ~ or /usr/local or wherever the stow target directory is. The only exception is when you want to use Stow to manage ~/.gitignore (say) as a symlink pointing to a file version-controlled with git. In that case, you can set up a .stow-local-ignore just for that git repo which overrides Stow's default ignore list and allows the .gitignore to be stowed. In fact I do exactly that myself: https://github.com/aspiers/git-config/blob/master/.stow-local-ignore

Hyper verbose with the -vvvvv flag shows

```bash
Using built-in ignore list
    Ignore list regexp for paths:    /(?^:(^|/)(^/README.*|^/LICENSE.*|^/\.stow\-local\-ignore$|^/COPYING)(/|$))/
    Ignore list regexp for segments: /(?^:^(\.hg|CVS|.+,v|\.gitignore|\.svn|#.*#|\.cvsignore|\.#.+|_darcs|.+~|\.git|RCS)$)/
```

-vvvvv

```bash
stow -nS --target $HOME -vvvvv --stow root
```

> WARNING: The changes are destructive. The script will back up the files it is about to overwrite at the same path as the target file to link. For example if it is about to link `~/.vimrc` to `~/dotfiles/.vimrc` it will back up `~/.vimrc` to `~/vimrc.bak`

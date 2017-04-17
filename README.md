# vim8config
a bunch of config files for my vim. Its not written to be shared and not useful for others beside me.

# shortcuts
 - F2  : spell checking
 - F7  : show .h or .cpp file
 - F8  : tag list
 - F9  : tag bar
 - F10 : NerdTree
 - F12 : SendCMDToTmuxSession()

 - CTRL + y : comment line
 - CTRL + x + o : complete things

 - \td : Task list
 - \8 : pep8
 - \n : NerdTree

 - :Pyhelp <module> to preview documentation

# generating tags

```
touch /home/mkreim/bin/opencv/opencv.tags
find . -name "*.h" | xargs ctags --append --declarations --globals --members -o /home/mkreim/bin/opencv/opencv.tags -T --update
find . -name "*.hpp" | xargs ctags --append --declarations --globals --members -o /home/mkreim/bin/opencv/opencv.tags -T --update
find . -name "*.cpp" | xargs ctags --append --declarations --globals --members -o /home/mkreim/bin/opencv/opencv.tags -T --update
```

# add submodules
```
git submodule add https://github.com/vim-scripts/VisIncr.git vim/pack/pluginRepos/start/VisIncr
git commit -m "added plugin VisIncr"
```

# update submodules
```
git submodule update --remote --merge
git commit -m "updated submodules"
```

# removing submodules
```
git submodule deinit vim/pack/pluginRepos/start/VisIncr
git rm vim/pack/pluginRepos/start/VisIncr
rm -Rf .git/modules/vim/pack/pluginRepos/start/VisIncr
git commit -m "removed plugin VisIncr"
```

# load opt modules
```
:packadd vim/pack/pluginRepos/opt/<name>
:source vim/optconfig/<name>.vimrc
```

# install stuff

```
sudo apt-get install pep8 exuberant-ctags
```

# links

 - https://shapeshed.com/vim-packages/
 - https://www.reddit.com/r/vim/comments/53tepo/what_are_some_of_the_best_plugins_to_use_vim_8/

# plugins
 - VisIncr https://github.com/vim-scripts/VisIncrcl
 - Colour-Sampler-Pack https://github.com/vim-scripts/Colour-Sampler-Pack
 - vim-colors-solarized https://github.com/altercation/vim-colors-solarized
 - csapprox https://github.com/vim-scripts/CSApprox.git
 - fugitive https://github.com/tpope/vim-fugitive.git
 - nerdcommenter https://github.com/scrooloose/nerdcommenter.git
 - nerdtree https://github.com/vim-scripts/The-NERD-tree.git
 - nerdtree-tabs https://github.com/jistr/vim-nerdtree-tabs
 - omnicppcomplete https://github.com/vim-scripts/OmniCppComplete.git
 - pep8 https://github.com/vim-scripts/pep8.git
 - pydoc https://github.com/fs111/pydoc.vim.git
 - taglist https://github.com/vim-scripts/taglist.vim.git
 - tagbar https://github.com/majutsushi/tagbar.git
 - tasklist https://github.com/vim-scripts/TaskList.vim.git
 - vim-fswitch https://github.com/derekwyatt/vim-fswitch.git
 - vimwiki  https://github.com/vim-scripts/vimwiki.git
 - VimLatex https://github.com/vim-latex/vim-latex

# new plugins
 - https://github.com/ramele/agrep
 - https://github.com/skywind3000/asyncrun.vim
 - https://github.com/metakirby5/codi.vim
 - https://github.com/metakirby5/codi.vim
 - https://valloric.github.io/YouCompleteMe/
 - https://github.com/vim-syntastic/syntastic
 - https://github.com/severin-lemaignan/vim-minimap

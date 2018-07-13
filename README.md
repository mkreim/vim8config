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

 - :Agrep -r 'foo.*bar' ~/my_project

# generating tags

``` 
touch /home/mkreim/bin/opencv/opencv.tags
find . -name "*.h" | xargs ctags --append --declarations --globals --members -o /home/mkreim/bin/opencv/opencv.tags -T --update
find . -name "*.hpp" | xargs ctags --append --declarations --globals --members -o /home/mkreim/bin/opencv/opencv.tags -T --update
find . -name "*.cpp" | xargs ctags --append --declarations --globals --members -o /home/mkreim/bin/opencv/opencv.tags -T --update
```

```
ctags -f opencv.tags --recurse=yes .
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
rm -rf .git/modules/vim/pack/pluginRepos/start/VisIncr
git commit -m "removed plugin VisIncr"
```

# load opt modules
```
:packadd vim/pack/pluginRepos/opt/<name>
:source vim/optconfig/<name>.vimrc
```

# install stuff

```
sudo apt-get install pep8 exuberant-ctags pylint python-flake8 cppcheck build-essential cmake python-dev python3-dev
sudo apt-get build-dep vim-gnome
mkdir -pv /home/mkreim/bin/vim8/install/
cd /home/mkreim/bin/vim8/install/
git clone https://github.com/vim/vim.git
cd vim/src/
./configure --prefix=/home/mkreim/bin/vim8/ --with-features=huge --enable-pythoninterp=yes --enable-cscope --with-compiledby='Michael Kreim  <michael@perfect-kreim.de>' && make -j 4 && make install
mkdir -pv /home/mkreim/config/vim8config/
cd /home/mkreim/config/vim8config/
git clone git@github.com:mkreim/vim8config.git
bash SetSoftLinks.sh
#activate submodules ??
cd ~/.vim/pack/pluginRepos/start/YouCompleteMe/
git submodule update --init --recursive
./install.py --clang-completer
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
 - agrep https://github.com/ramele/agrep
 - asyncrun https://github.com/skywind3000/asyncrun.vim
 - syntastic https://github.com/vim-syntastic/syntastic
 - ale https://github.com/w0rp/ale.git
 - vim-prettier https://github.com/prettier/vim-prettier.git
 - ultisnips https://github.com/SirVer/ultisnips
 - vim-surround https://github.com/tpope/vim-surround
 - ctrlP https://github.com/ctrlpvim/ctrlp.vim
 - zeavim https://github.com/KabbAmine/zeavim.vim
 - completor https://github.com/maralla/completor.vim
 - previm https://github.com/kannokanno/previm.git
 - cheat.sh vim/UltiSnips/javascript.snippets

# new plugins
 - https://github.com/mh21/errormarker.vim
 - https://github.com/skywind3000/asyncrun.vim/wiki/Cooperate-with-famous-plugins 
 - YouCompleteMe https://valloric.github.io/YouCompleteMe/

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

# install stuff

```
sudo apt-get install pep8
```

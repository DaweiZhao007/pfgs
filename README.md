pfgs
========

A bunch of configuration files for editors and other UNIX tools.

Installation
------------

Clone this repo into `~/.pfgs`:

    $ git clone https://github.com/DaweiZhao007/pfgs ~/.pfgs

Then install the pfgs:

    $ cd ~/.pfgs
    $ make help        # Show help message
    $ make install     # Create symblinks
    $ make deps        # Optional install system dependences like 'ctags' and 'pycscope', require root privilege
    $ make uninstall   # Restore backups and remove symblinks

It will backup existing files as `<file>.pfgs.bak`.

The toolsConfig will be symlinked, e.g. `~/.bashrc` symlinked to `~/.pfgs/pfgs/bashrc`.

etc: U maybe should install jedi-vim manually!
On Arch Linux, you can also install jedi-vim from official repositories as
vim-jedi. It is also available on Debian (≥8) and Ubuntu (≥14.04) as
vim-python-jedi. On Fedora Linux, it is available as vim-jedi.

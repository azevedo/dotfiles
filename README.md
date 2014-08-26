dotfiles
========

Configure:

Although not required, you may want to start by creating your own `.rcrc` from the sample:

    cp dotfiles/rcrc $HOME/.rcrc

Install:

    rcup

Or, if you did not configure your `.rcrc` file, as described above:

    rcup -d dotfiles -x README.md -x LICENSE -x Brewfile -x samples other

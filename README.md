Vimfiles
========

Vi Improved customization files.

## Introduction

This vim customization collection was created primarily to support development for PHP and Drupal powered web-sites. It contains extensions and customizations to help with editing and viewing files associated with:

1. Apache configuration and logs
1. PHP code
1. Drupal 
2. JavaScript, including jQuery and nodejs
1. Varnish configurations
1. Puppet
1. Vagrant
1. Markdown documents
1. ssh client configuration
1. git, including merge conflict resolution

## Requirements

To use these customizations for vim, you need to have vim installed. 

I currently use, test and update this collection of `vimfiles` with vim v7.4, but they should work fine with any vim install >= v7.2. 

## Installation

To get up and running, install vim to the usual location, then:

1. **Make a back-up of the current vimfiles folder and clone this repository to vimfiles**
  
  - To install for the current user only:

          [[ -d ~/.vim ]] && mv ~/.vim ~/.vim.original
          git clone --recursive https://github.com/christopher-hopper/vimfiles.git ~/.vim
  - To install for all users:

          [[ -d /usr/share/vim/vimfiles ]] && \
            sudo mv /usr/share/vim/vimfiles /usr/share/vim/vimfiles.original
          sudo git clone --recursive https://github.com/christopher-hopper/vimfiles.git \
            /usr/share/vim/vimfiles
1. **Symlink the vimrc configuration file**
  
  - To install for the current user only:

          [[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.original
          ln -s ~/.vim/vimrc ~/.vimrc
  - To install for all users:

          [[ -f /etc/vim/vimrc ]] && sudo mv /etc/vim/vimrc /etc/vimrc.original
          sudo ln -s /usr/share/vim/vimfiles/vimrc /etc/vim/vimrc

## FAQ

1. **Which plug-ins are currently included in vimfiles?**
  
  At the time of writing, the following plug-ins have been included and configured as part of vimfiles:

  | Plugin Name          | Version     | Source                   | Documentation                          |
  |----------------------|-------------|--------------------------|----------------------------------------|
  | pathogen             | 2.4         | [vim-pathogen][]         | [vim-pathogen documentation][]         |
  | git                  | [79f5482][] | [vim-git][]              | [vim-git documentation][]              |
  | fugitive             | 2.2         | [vim-fugitive][]         | [vim-fugitive documentation][]         |
  | commentary           | 1.3         | [vim-commentary][]       | [vim-commentary documentation][]       |
  | repeat               | 1.1         | [vim-repeat][]           | [vim-repeat documentation][]           |
  | sensible             | 1.1         | [vim-sensible][]         | [vim-sensible documentation][]         |
  | surround             | 2.1         | [vim-surround][]         | [vim-surround documentation][]         |
  | Secure Modelines     | [9751f29][] | [securemodelines][]      | [securemodelines documentation][]      |
  | javascript libraries | 0.5         | [javascript-libraries][] | [javascript-libraries documentation][] |
  | javascript syntax    | 0.8.2       | [javascript-syntax][]    | [javascript-syntax documentation][]    |
  | node (nodejs)        | 0.8.1+      | [vim-node][]             | [vim-node documentation][]             |

[vim-pathogen]: https://github.com/tpope/vim-pathogen
[vim-pathogen documentation]: http://www.vim.org/scripts/script.php?script_id=2332
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-fugitive documentation]: http://www.vim.org/scripts/script.php?script_id=2975
[vim-git]: https://github.com/tpope/vim-git
[vim-git documentation]: http://www.vim.org/scripts/script.php?script_id=1654
[79f5482]: https://github.com/tpope/vim-git/commit/79f5482
[vim-commentary]: https://github.com/tpope/vim-commentary
[vim-commentary documentation]: http://www.vim.org/scripts/script.php?script_id=3695
[vim-repeat]: https://github.com/tpope/vim-repeat
[vim-repeat documentation]: http://www.vim.org/scripts/script.php?script_id=2136
[vim-sensible]: https://github.com/tpope/vim-sensible
[vim-sensible documentation]: http://www.vim.org/scripts/script.php?script_id=4391
[vim-surround]: https://github.com/tpope/vim-surround
[vim-surround documentation]: http://www.vim.org/scripts/script.php?script_id=1697
[securemodelines]: https://github.com/ciaranm/securemodelines
[securemodelines documentation]: http://www.vim.org/scripts/script.php?script_id=1876
[9751f29]: https://github.com/ciaranm/securemodelines/tree/9751f29
[javascript-libraries]: https://github.com/othree/javascript-libraries-syntax.vim
[javascript-libraries documentation]: http://www.vim.org/scripts/script.php?script_id=4428
[javascript-syntax]: https://github.com/jelera/vim-javascript-syntax
[javascript-syntax documentation]: http://www.vim.org/scripts/script.php?script_id=3425
[vim-node]: https://github.com/moll/vim-node
[vim-node documentation]: http://www.vim.org/scripts/script.php?script_id=4674

## Maintainer

This collection is maintained on Github by:

- [Christopher Hopper](https://github.com/christopher-hopper)

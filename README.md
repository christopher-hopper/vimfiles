Vimfiles
========

Vi Improved customization files.

## Introduction

This vim customization collection was created primarily to support development for PHP and Drupal powered web-sites. It contains extensions and customizations to help with editing and viewing files associated with:

1. Apache configuration and logs
1. PHP code
1. Drupal 
1. Varnish configurations
1. Puppet
1. Vagrant
1. Markdown documents
1. ssh client configuration
1. git, including merge conflict resolution

## Requirements

To use these customizations for vim, you need to have vim installed. 

I currently use, test and update this collection of `vimfiles` with vim 7.4, but they would probably work fine with any vim 7.x install. 

## Installation

To get up and running, install vim to the usual location, then:

1. **Make a back-up of the current vimfiles folder and clone this repository to vimfiles**
  
  - To install for the current user only:

          [[ -d ~/.vim ]] && mv ~/.vim ~/.vim.original
          git clone git@github.com:christopher-hopper/vimfiles.git ~/.vim
  - To install for all users:

          [[ -d /usr/share/vim/vimfiles ]] && sudo mv /usr/share/vim/vimfiles /usr/share/vim/vimfiles.original
          sudo git clone git@github.com:christopher-hopper/vimfiles.git /usr/share/vim/vimfiles
1. **Symlink the vimrc configuration file**
  
  - To install for the current user only:

          [[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.original
          ln -s ~/.vim/vimrc ~/.vimrc
  - To install for all users:

          [[ -f /etc/vim/vimrc ]] && sudo mv /etc/vim/vimrc /etc/vimrc.original
          sudo ln -s /usr/share/vim/vimfiles/vimrc /etc/vim/vimrc
1. **Refresh the vim help files**

  - When installed for the current user only:

          vim -c 'helptags $HOME/.vim/doc | q'
  - When installed for all users:

          sudo vim -c 'helptags $VIM/vimfiles/doc | q'

## FAQ

1. **Which plug-ins are currently included in vimfiles?**
  
  At the time of writing, the following plug-ins have been included and configured as part of vimfiles:

  | Plugin Name          | Version  | Source                   | Documentation                          |
  |----------------------|----------|--------------------------|----------------------------------------|
  | git                  | 6.0+18   | [vim-git][]              | [fugitive documentation][]             |
  | fugitive             | 2.2      | [vim-fugitive][]         | [git documentation][]                  |
  | NERD commenter       | 2.3.0    | [nerdcommenter][]        | [NERD_commenter documentation][]       |
  | Secure Modelines     | 20140926 | [securemodelines][]      | [securemodelines documentation][]      |
  | javascript libraries | 0.4      | [javascript-libraries][] | [javascript-libraries documentation][] |
  | javascript syntax    | 0.8+31   | [javascript-syntax][]    | [javascript-syntax documentation][]    |
  | node (nodejs)        | 0.8.1+14 | [vim-node][]             | [vim-node documentation][]             |

[vim-fugitive]: https://github.com/tpope/vim-fugitive
[fugitive documentation]: http://www.vim.org/scripts/script.php?script_id=2975
[vim-git]: https://github.com/tpope/vim-git
[git documentation]: http://www.vim.org/scripts/script.php?script_id=1654
[nerdcommenter]: https://github.com/scrooloose/nerdcommenter
[NERD_commenter documentation]: http://www.vim.org/scripts/script.php?script_id=1218
[securemodelines]: https://github.com/ciaranm/securemodelines
[securemodelines documentation]: http://www.vim.org/scripts/script.php?script_id=1876
[javascript-libraries]: https://github.com/othree/javascript-libraries-syntax.vim
[javascript-libraries documentation]: http://www.vim.org/scripts/script.php?script_id=4428
[javascript-syntax]: https://github.com/jelera/vim-javascript-syntax
[javascript-syntax documentation]: http://www.vim.org/scripts/script.php?script_id=3425
[vim-node]: https://github.com/moll/vim-node
[vim-node documentation]: http://www.vim.org/scripts/script.php?script_id=4674

## Maintainer

This collection is maintained on Github by:

- [Christopher Hopper](https://github.com/christopher-hopper)


#!/usr/bin/python
import os

SYNC_LIST = (
    'bash_aliases',
    'bash_profile',
    'tmux.conf',
    'vimrc',
    'vim',
    'gitconfig',
    'zshrc',
    'eslintrc',
    'tern-project'
)

HOME_DIR = os.path.expanduser('~')
DOTFILE_DIR = os.path.dirname(os.path.realpath(__file__))

def sync(sync_list):

    for entry in sync_list:
        # prompt
        input = raw_input('Do you want create symlink for %s ? (N/y) ' % entry)

        if input != 'y':
            continue
        # attempt unlink, just in case something is broken
        try:
            print 'Unlinking .%s' % entry
            os.unlink('%s/.%s' % (HOME_DIR, entry))
        except OSError:
            print 'Unable to unlink %s/.%s, continuing...' % (HOME_DIR, entry)

        # create symlink
        os.symlink('%s/%s' % (DOTFILE_DIR, entry), '%s/.%s' % (HOME_DIR, entry))
        print 'Symlink created for .%s' % entry

def sync_neovim():
    config_path = '%s/.config' % HOME_DIR

    if not os.path.exists(config_path):
        print 'Creating path at %s' % config_path
        os.makedirs(config_path)

    neovim_paths = [ 'nvim', 'nvim/init.vim' ]

    for entry in neovim_paths:
        # prompt
        input = raw_input('Do you want create symlink for %s ? (N/y) ' % entry)

        if input != 'y':
            continue

        try:
            print 'Unlinking %s/%s' % (config_path, entry)
            os.unlink('%s/%s' % (config_path, entry))
        except OSError:
            print 'Unable to unlink %s/%s' % (config_path, entry)

        # create symlink
        if entry == 'nvim':
            os.symlink('%s/vim' % DOTFILE_DIR, '%s/%s' % (config_path, entry))
        elif entry == 'nvim/init.vim':
            os.symlink('%s/init.vim' % DOTFILE_DIR, '%s/%s' % (config_path, entry))

        print 'Symlink created for %s/%s' % (config_path, entry)

if __name__ == '__main__':
    sync(SYNC_LIST)
    sync_neovim()

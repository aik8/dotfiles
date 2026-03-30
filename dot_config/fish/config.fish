if status is-interactive
    # Commands to run in interactive sessions can go here

end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Add LunarVim (and other stuff) to the PATH
fish_add_path $HOME/.local/bin

require 'rake'
require 'erb'

desc "Install dot files into home directory"

task :install do

   # Files to be ignored go here
   files = Dir['*'] - %w[Rakefile README.md oh-my-zsh bin]

   install_oh_my_zsh
   switch_to_zsh
   update_and_upgrade
   install_common_packages
   install_dotfiles(files)

   # Install tools and languages
   install_solarized_terminal_theme
   install_zenburn_terminal_theme
   install_dropbox
   install_spacemacs
   install_gibo
   install_go
   install_python_anaconda2
   install_python_anaconda3

   puts "Finished setting up environment!"
end

def install_dotfiles(files)

   # Setting this to true disables the overwrite prompt for the dotfiles installation.
   # This can be set automatically from the first overwrite prompt by pressing 'a'
   replace_all = false

   # Cycle through all files in the directory
   files.each do |file|

       # Create a dotfile directory for directories in this folder
       system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//

       # If the file exists already
       # (ignore .erb extension if present, still account for file)
       if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
           # Check if it is different
           if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
               # If not different, state that it is identical
               puts "Identical ~/.#{file.sub(/\.erb$/, '')}"
            elsif replace_all
                # If overwrite prompts are disabled, automatically replace the file
                replace_file(file)
            else
                # Otherwise prompt for overwriting the file
                # The 'a' here stands for overwite all from now on
                print "Overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
                case $stdin.gets.chomp
                when 'a'
                    replace_all = true
                    replace_file(file)
                when 'y'
                    replace_file(file)
                when 'q'
                    exit
                else
                    puts "Skipping ~/.#{file.sub(/\.erb$/, '')}"
                end
           end
       else
           # Otherwise if the file doesn't exist already
           # Symbolically link the file
           link_file(file)
       end
    end
end

def replace_file(file)
    # Remove the dotfile directory for the specified file
    system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}

    # Symbolically link the file
    link_file(file)
end

def link_file(file)
    # If the file has a .erb extension
    if file =~ /.erb$/
        # Generate the file by executing the embedded ruby code
        puts "Generating ~/.#{file.sub(/\.erb$/, '')}"
        File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
            new_file.write ERB.new(File.read(file)).result(binding)
        end
    # Copy zshrc and zshenv instead of linking
    elsif file =~ /zshrc$/ || file =~ /zshenv$/
        puts "Copying ~/.#{file}"
        system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
    # Otherwise symbolically link the file
    else
        puts "Linking ~/.#{file}"
        system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
    end
end

def install_oh_my_zsh
    if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
        puts "Found ~/.oh-my-zsh!"
    else
        print "Install oh-my-zsh? [ynq] "
        case $stdin.gets.chomp
        when 'y'
            puts "Installing oh-my-zsh"
            system %Q{sudo apt-get install -qq zsh}
            system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh}
        when 'q'
            exit
        else
            puts "Skipping oh-my-zsh installation. You will need to change ~/.zshrc."
        end
    end
end

def switch_to_zsh
    if ENV["SHELL"] =~ /zsh/
        puts "using zsh"
    else
        print "switch to zsh? (recommended) [ynq] "
        case $stdin.gets.chomp
        when 'y'
            puts "Switching to zsh..."
            system %Q{chsh -s $(which zsh)}
        when 'q'
            exit
        else
            puts "Skipping zsh."
        end
    end
end

def update_and_upgrade
   # Install dependencies
    print "Update and Upgrade? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Updating and Upgrading..."
        system %Q{ bash -c 'sudo apt-get update
                            sudo apt-get upgrade
                            sudo apt-get autoremove' }
    when 'q'
        exit
    else
        puts "Skipping common packages installation."
    end
end

def install_common_packages
   # Install dependencies
    print "Install common packages? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing common packages..."
        system %Q{ bash -c 'sudo apt-get install -qq fonts-hack-ttf
                            sudo apt-get install -qq global
                            sudo apt-get install -qq npm
                            sudo npm install -g diff-so-fancy
                            sudo npm install -g tern
                            sudo apt-get install -qq tmux
                            sudo apt-get install -qq ack-grep
                            sudo apt-get install -qq silversearcher-ag
                            sudo apt-get install -qq exuberant-ctags
                            sudo apt-get install -qq build-essential cmake
                            sudo apt-get install -qq python-dev
                            sudo apt-get install -qq xpad
                            sudo apt-get install -qq imagemagick
                            sudo apt-get install -qq dconf-cli' }
    when 'q'
        exit
    else
        puts "Skipping common packages installation."
    end
end

def install_spacemacs
    print "Install Spacemacs? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Spacemacs..."
        system %Q{ bash -c 'sudo add-apt-repository ppa:ubuntu-elisp/ppa
                            sudo apt-get update
                            sudo apt-get install emacs-snapshot
                            git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
                            pushd ~/.emacs.d
                            git checkout develop
                            popd'}
    when 'q'
        exit
    else
        puts "Skipping spacemacs installation."
    end
end

def install_python_anaconda2
    print "Install Anaconda Python 2.7? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Downloading Anaconda Python 2.7..."
        system %Q{wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.4.0-Linux-x86_64.sh}
        puts "Installing Anaconda Python 2.7..."
        system %Q{bash Anaconda2-2.4.0-Linux-x86_64.sh}
    when 'q'
        exit
    else
        puts "Skipping Anaconda Python 2.7."
    end
end

def install_python_anaconda3
    print "Install Anaconda Python 3.5? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Downloading Anaconda Python 3.5..."
        system %Q{wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.4.0-Linux-x86_64.sh}
        puts "Installing Anaconda Python 3.5..."
        system %Q{bash Anaconda3-2.4.0-Linux-x86_64.sh}
    when 'q'
        exit
    else
        puts "Skipping Anaconda Python 3.5."
    end
end

def install_go
    print "Install Go? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Go..."
        system %Q{sudo apt-get install -qq golang}
        puts "Installing Go Support Packages..."
        system %Q{ bash -c 'export GOPATH=~/.go
                            export PATH=$PATH:$GOPATH
                            go get -u -v github.com/rogpeppe/godef
                            go get -u -v github.com/nsf/gocode
                            go get -u -v github.com/rogpeppe/godef
                            go get -u -v golang.org/x/tools/cmd/oracle
                            go get -u -v golang.org/x/tools/cmd/gorenamego get -u -v golang.org/x/tools/cmd/oracle'}
    when 'q'
        exit
    else
        puts "Skipping go installation."
    end
end

def install_gibo
    print "Install Gibo? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Gibo..."
        system %Q{ bash -c 'git clone https://github.com/simonwhitaker/gibo ~/bin/gibo
                            #chmod +x ~/bin/gibo
                            ~/bin/gibo/gibo -u'}
    when 'q'
        exit
    else
        puts "Skipping gibo installation."
    end
end

def install_solarized_terminal_theme
    print "Install solarized terminal theme? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        system %Q{ bash -c 'git clone https://github.com/anthony25/gnome-terminal-colors-solarized
                            cd gnome-terminal-colors-solarized
                            ./install.sh
                            cd ../'}
    when 'q'
        exit
    else
        puts "Skipping solarized installation."
    end
end

def install_zenburn_terminal_theme
  print "Install zenburn terminal theme? [ynq]"
  case $stdin.gets.chomp
  when 'y'
    system %Q{ bash -c ' git clone https://github.com/anuragsoni/seoul256-gnome-terminal.git ~/.config/seoul256-gnome-terminal
                         source ~/.config/seoul256-gnome-terminal/seoul256-dark.sh '}
  when 'q'
    exit
  else
    puts "Skipping zenburn installation."
  end
end


def install_dropbox
  print "Install Dropbox? [ynq]"
  case $stdin.gets.chomp
  when 'y'
    # Install solarized dark and patched powerline fonts
    system %Q{ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - }
    system %Q{ (~/.dropbox-dist/dropboxd >/dev/null 2>/dev/null &) }
  when 'q'
    exit
  else
    puts "Skipping terminal configuration."
  end
end

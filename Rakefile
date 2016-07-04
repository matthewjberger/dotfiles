require 'rake'
require 'erb'

desc "Install dot files into home directory"

task :install do

   # Files to be ignored go here
   files = Dir['*'] - %w[Rakefile README.md oh-my-zsh gpm gvp bin fonts]

   install_oh_my_zsh
   switch_to_zsh
   install_common_packages
   install_dotfiles(files)

   # Install tools and languages
   install_terminal_config
   install_spacemacs
   install_gibo
   install_go
   install_node_npm
   install_python_anaconda2
   install_python_anaconda3
   install_ruby_on_rails_rbenv
   install_scala
   install_sdl_opengl

   # Vim's youcompleteme auto-completion plugin requires go-lang to be installed
   # in order to have code-completion for go programs, so it must come last
   install_vim

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
    # Copy zshrc instead of linking
    elsif file =~ /zshrc$/
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

def install_common_packages
   # Install dependencies
    print "Install common packages? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        # Python-Dev is necessary here so that
        # the youcompleteme plugin for vim will build properly
        puts "Installing common packages..."
        system %Q{
                  bash -c '
                           sudo apt-get update
                           sudo apt-get upgrade
                           sudo apt-get autoremove
                           sudo apt-get install -qq global
                           sudo apt-get install -qq npm
                           sudo npm install -g diff-so-fancy
                           sudo apt-get install -qq tmux
                           sudo apt-get install -qq ack-grep
                           sudo apt-get install -qq silversearcher-ag
                           sudo apt-get install -qq exuberant-ctags
                           sudo apt-get install -qq build-essential cmake
                           sudo apt-get install -qq python-dev
                           sudo apt-get install -qq xpad
                           sudo apt-get install -qq imagemagick
                          '
                 }
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
                            sudo apt-get install emacs-snapshot'}
        system %Q{git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d}
    when 'q'
        exit
    else
        puts "Skipping spacemacs installation."
    end
end

def install_vim
    print "Install Vim? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Vim..."
        system %Q{bash -c '#sudo apt-get install -qq vim-nox vim-gtk
                           #TODO: build vim from source here
                           git submodule update --force --init --recursive
                           vim +PlugInstall +qa'}
    when 'q'
        exit
    else
        puts "Skipping vim installation."
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

def install_ruby_on_rails_rbenv
    print "Install Rails? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Ruby on Rails..."
        system %Q{ bash -c '
                   sudo apt-get install -qq git-core
                   sudo apt-get install -qq curl
                   sudo apt-get install -qq zlib1g-dev
                   sudo apt-get install -qq build-essential
                   sudo apt-get install -qq libssl-dev
                   sudo apt-get install -qq libreadline-dev
                   sudo apt-get install -qq libyaml-dev
                   sudo apt-get install -qq libsqlite3-dev
                   sudo apt-get install -qq sqlite3
                   sudo apt-get install -qq libxml2-dev
                   sudo apt-get install -qq libxslt1-dev
                   sudo apt-get install -qq libcurl4-openssl-dev
                   sudo apt-get install -qq python-software-properties
                   sudo apt-get install -qq libffi-dev

                   cd
                   git clone https://github.com/sstephenson/rbenv.git .rbenv
                   git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
                   exec $SHELL

                   git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

                   rbenv install 2.2.3
                   rbenv global 2.2.3
                   ruby -v
                   echo "gem: --no-ri --no-rdoc" > ~/.gemrc
                   sudo gem install bundler

                   sudo gem install rails -v 4.2.4
                   rbenv rehash

                   sudo apt-get install -qq mysql-server
                   sudo apt-get install -qq mysql-client
                   sudo apt-get install -qq libmysqlclient-dev
                   sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"

                   wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
                   sudo apt-get update
                   sudo apt-get install -qq postgresql-common
                   sudo apt-get install -qq postgresql-9.3 libpq-dev
         '}
    when 'q'
        exit
    else
        puts "Skipping Ruby on Rails installation."
    end
end

def install_node_npm
    print "Install Node? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        # The nodejs package contains npm automatically
        # so a seperate installation is not needed
        puts "Installing Node..."
        system %Q{bash -c 'curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
                           sudo apt-get install -qq nodejs
                           sudo apt-get install -qq build-essential
                           sudo ln -s /usr/bin/nodejs /usr/bin/node'}
    when 'q'
        exit
    else
        puts "Skipping Node installation."
    end
end

def install_go
    print "Install Go? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Go..."
        system %Q{sudo apt-get install -qq golang}
        puts "Installing Go Package Manager (GPM)..."
        system %Q{ bash -c '#git clone https://github.com/pote/gvp.git
                            #cd gvp
                            #./configure
                            #sudo make install
                            #cd ../
                            #git clone https://github.com/pote/gpm.git
                            #cd gpm
                            #./configure && sudo make install
                            #cd ../
                            #source gvp
                            go get -u -v github.com/nsf/gocode
                            go get -u -v github.com/rogpeppe/godef
                            go get -u -v golang.org/x/tools/cmd/oracle'}
    when 'q'
        exit
    else
        puts "Skipping go installation."
    end
end

def install_sdl_opengl
    print "Install SDL2 and OpenGL? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing SDL2 and OpenGL..."
        system %Q{ bash -c '
                            sudo apt-get install -qq libsdl2-dev
                            sudo apt-get install -qq libsdl2-image-dev
                            sudo apt-get install -qq libsdl2-ttf-dev
                            sudo apt-get install -qq libsdl2-mixer-dev
                            sudo apt-get install -qq libglew-dev
                            sudo apt-get install -qq libglm-dev
                            sudo apt-get install -qq libassimp-dev
                            sudo apt-get install -qq libbullet-dev'}
    when 'q'
        exit
    else
        puts "Skipping SDL2 and OpenGL installation."
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

def install_scala
    print "Install Scala? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        puts "Installing Scala..."
        system %Q{ bash -c 'sudo apt-get install scala
                            echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
                            sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
                            sudo apt-get update
                            sudo apt-get install sbt'}
    when 'q'
        exit
    else
        puts "Skipping Scala installation."
    end
end

def install_terminal_config
    print "Install powerline fonts and solarized terminal theme? [ynq]"
    case $stdin.gets.chomp
    when 'y'
        # Install solarized dark and patched powerline fonts
        system %Q{ bash -c 'git clone https://github.com/powerline/fonts fonts
                            cd fonts
                            sudo apt-get install -qq dconf-cli
                            ./install.sh'
                            cd ../}
        system %Q{ bash -c 'git clone https://github.com/anthony25/gnome-terminal-colors-solarized
                            cd gnome-terminal-colors-solarized
                            ./install.sh'
                            cd ../}
    when 'q'
        exit
    else
        puts "Skipping terminal configuration."
    end
end

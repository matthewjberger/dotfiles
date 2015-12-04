require 'rake'
require 'erb'

desc "Install dot files into home directory"

task :install do
   install_oh_my_zsh
   switch_to_zsh
   install_editors
   replace_all = false
   files = Dir['*'] - %w[Rakefile README.rdoc oh-my-zsh]
   files.each do |file|
       system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
       if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
           if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
               puts "Identical ~/.#{file.sub(/\.erb$/, '')}"
            elsif replace_all
                replace_file(file)
            else
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
            link_file(file)
       end
    end
   install_common_packages
end

def replace_file(file)
    system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
    link_file(file)
end

def link_file(file)
    if file =~ /.erb$/
        puts "Generating ~/.#{file.sub(/\.erb$/, '')}"
        File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
            new_file.write ERB.new(File.read(file)).result(binding)
        end
    elsif file =~ /zshrc$/ # Copy zshrc instead of linking
        puts "Copying ~/.#{file}"
        system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
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
            system %Q{chsh -s 'which zsh'}
        when 'q'
            exit
        else
            puts "Skipping zsh."
        end
    end
end

def install_editors
    puts "Installing Vim and Emacs"
    sh "bash -c 'sudo apt-get update
		 sudo apt-get upgrade
		 sudo apt-get install -y vim-nox
                 sudo apt-get install -y emacs'"
    system %Q{git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d}
end

def install_common_packages
   # Install dependencies
   puts "Installing common packages"
   sh "bash -c 'sudo apt-get install -y ack-grep
                sudo apt-get install -y silversearcher-ag
                sudo apt-get install -y exuberant-ctags
                sudo apt-get install -y build-essential cmake
                sudo apt-get install -y python-dev
                sudo apt-get install -y golang
                git submodule update --force --init --recursive
                vim +PlugInstall +qa'"
end

require 'rake'
require 'erb'

desc "Install dot files into home directory"

task :install do

   install_zenburn_terminal_theme
   install_dropbox
   install_gibo
   install_go
   install_python_anaconda2
   install_python_anaconda3

   puts "Finished setting up environment!"
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

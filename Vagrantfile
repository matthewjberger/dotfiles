# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "mloskot/manjaro-i3-17.0-minimal"
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = true

        # Customize the amount of memory on the VM:
        vb.memory = "2048"

        # Customize the amount of cpus on the VM:
        vb.cpus = 2

        # Set the video memory to 128Mb:
        vb.customize ["modifyvm", :id, "--vram", "128"]

        # Enable 3D acceleration:
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    end

    config.vm.provision "shell", inline: <<-SHELL
        sudo pacman -S bash --noconfirm
    SHELL
end

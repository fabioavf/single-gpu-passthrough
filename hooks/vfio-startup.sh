#!/bin/bash
# Helpful to read output when debugging
set -x

echo "Beginning of startup!"

# Stop currently running display manager
systemctl stop gdm.service

sleep "${medium_delay}"

# Unbind VTconsoles if currently bound
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-Framebuffer
# echo efi-framebuffer

sleep 5

# Unload all Radeon drivers
modprobe -r amdgpu
 
# Unbind the GPU from display driver
virsh nodedev-detach pci_0000_09_00_0
virsh nodedev-detach pci_0000_09_00_1

rtcwake -m mem -s 5
 
# Load VFIO Kernel Module  
modprobe vfio_pci  

echo "End of startup!"
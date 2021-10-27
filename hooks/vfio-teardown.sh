#!/bin/bash
set -x

echo "Beginning of teardown!"

# Unload VFIO Kernel Module
modprobe -r vfio_iommu_type1
modprobe -r vfio_pci  
modprobe -r vfio

# Rebind the GPU from display driver
virsh nodedev-reattach pci_0000_09_00_0
virsh nodedev-reattach pci_0000_09_00_1

# Rebind VT consoles (adapted from https://www.kernel.org/doc/Documentation/fb/fbcon.txt)
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

# Reload all Radeon drivers
modprobe amdgpu

# Restart Display Manager
systemctl start gdm.service

echo "End of teardown!"
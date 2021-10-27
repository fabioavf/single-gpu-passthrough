# QEMU/KVM Single GPU Passthrough guide

My computer:

* **Processor:** Ryzen 5 3600
* **Motherboard:** Asus ROG Strix B550F
* **Memory:** 2x HyperX 8GB DDR4 2400MHz
* **Graphics Card:** Gigabyte Aorus RX 5700 XT
* **Storage:** 1TB NVMe Asgard SSD

Follow [this guide](https://gitlab.com/risingprismtv/single-gpu-passthrough) for remaining info.

## Hooks

They should all be located at `/etc/libvirt/hooks`.

Make a symbolic link of the hook scripts

```bash
ln /etc/libvirt/hooks/vfio-startup.sh /bin/vfio-startup.sh
ln /etc/libvirt/hooks/vfio-teardown.sh /bin/vfio-teardown.sh
```

## GPU Rom

`GPU.rom` should be placed at `/var/lib/libvirt/vbios`
resource "proxmox_vm_qemu" "test_one" {
    count = 1
    vmid = 100
    name = "test_one"
    target_node = "nodename"
    clone = "ubuntu-cloud"

    onboot = true
    agent = 0
    os_type = "cloud-init"
    cpu = "host"
    cores = 1
    sockets = 1
    memory = 4096

    network {
        bridge = "vmbr0"
        model  = "virtio"
        macaddr  = "mac_address"
    }

    disks {
        scsi {
            scsi0 {
                disk {
                    size = 10
                    storage = "storage"
                }
            }
        }
    }

    cloudinit_cdrom_storage = "storage"
    scsihw   = "virtio-scsi-pci" 
    bootdisk = "scsi0"

    ipconfig0 = "ip=ip_address/24,gw=ip_gateway"
    ciuser = "USER"
    sshkeys = <<EOF id_rsa
    EOF
}
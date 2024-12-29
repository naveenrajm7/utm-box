os_name                 = "windows"
os_version              = "11"
os_arch                 = "aarch64"
is_windows              = true
iso_url                 = "./builds/iso/Win11_24H2_English_Arm64.iso"
iso_checksum            = "57d1dfb2c6690a99fe99226540333c6c97d3fd2b557a50dfe3d68c3f675ef2b0"

shutdown_command        = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\""
box_name                = "windows-11"

uefi_boot               = true
disable_vnc             = true
hard_drive_interface    = "nvme"
guest_additions_mode    = "attach"

# Working Display for given ISO 
# For reference and future use when UTM supports adding displays
utm_display             = "virtio-ramfb-gl"

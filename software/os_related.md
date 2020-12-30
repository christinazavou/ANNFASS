BIOS (Basic Input Output System)
---
BIOS instructs the computer on how to perform basic functions such as booting and keyboard control. It is also used to identify and configure the hardware in a computer such as hard drive, floppy drive, CPUm memory... 

BIOS comes installed from the moment the machine is manufactured.

BIOS is independed of any OS, it is part of the motherboard hardware.

- Windows machines generally have two BIOS types: Legacy or UEFI


Bootloader
---

Bootloader is a piece of code that runs before any OS is running. A bootloader is used to boot other OSs. Each OS usually has its own bootloader.


####GRUB (Grand Unified Bootloader)

GRUB is a bootloader package developed to support multiple OSs and allow the user to select among them during boot-up. It is Ubuntu's default bootloader.



Create a Windows 10 UEFI boot USB:
	GPT partition scheme for UEFI
	FAT32 scheme

Create a Windows 10 Legacy Boot USB:
	MBR parition scheme for BIOS
	NTFS


How Dual-Booting Works:
---
OS is installed on hard drive. When you boot PC, BIOS loads the boot loader from the hard drive and bootloader boots the installed OS.

You can put many OS in one drive (by partitioning the hard drive).

You can also put more hard drives and put one OS on each. (If each operating system is installed to a separate drive, you could actually switch between both by selecting a different drive as your boot device every time you boot. This is inconvenient and you’ll probably have two operating systems installed on the same drive, so that’s where a boot manager comes in.) 

You can choose which hard drive to boot in your BIOS or boot menu. (like when we boot from flask usb). 

You can also boot an OS (like a live Ubuntu system) from external storage media.

When you install a Linux distribution, it typically installs the Grub boot loader. Grub loads instead of the Windows boot loader at boot time if Windows was already installed, allowing you to choose the OS you want to boot. Windows also has its own boot loader, which can be used to select between different versions of Windows if you have many installed.

The Windows boot loader recognizes most Linux distros, and the Linux boot loader usually recognizes Windows without problems. The difference is that Windows, with updates to the operating system, tends to fail. For this reason, if you will put Windows and Ubuntu on the same hard drive we recommend that you use linux bootloader (GRUB). **And for this, it is best to install first Windows and then Ubuntu.**

Fresh Installation of Ubuntu 18 and Windows 10 on one hard disk:
---

----------------------------------------------------------------
----------------------------------------------------------------

In [this post](https://www.youtube.com/watch?v=u5QyjHIYwTQ&ab_channel=It%27sFOSS-LinuxBlog), he has a disk with 238 GB...he is using 223GB for Windows... He is shrinking this (from Windows Disk Management) to create some free space to install ubuntu there...so he has created 98GB of unallocated space. He is creating a live USB (using Etcher). He reboots PC, and at boot screen he presses F10 or F12 and boot from usb. Then choose install Ubuntu.

He can use install Ubuntu alongside Windows Boot Manager or Something else. He chooses something else. Then he selects the free space we created before and clicks on the + sign. 

He creates 
- a partition for root, i.e. mount point is /, size is 20GB, type is logical, location is beginng, use as ext4. 
- a swap partition, uses half of ram space as space, logical, beginning, use as swap. 
- a home partition with the rest of space available, i.e. logical, beginning, use as ext4, mount at /home. He lets the device for boot to be the preselected /dev/sda.

(I have 500GB disk... so I can use 200GB for Windows and 275GB for Ubuntu.)

----------------------------------------------------------------
----------------------------------------------------------------

In [this post](https://helpdeskgeek.com/windows-10/how-to-dual-boot-ubuntu-with-windows-10/), he creates the Ubuntu bootable usb using Rufus in Windows, which is UEFI-compatible. He selects MBR partition, BIOS or UEFI target, FAT32 file system. He is later using Disk Manager in Windows to allocate a minimum of 64GB free storage for Ubuntu by selecting shrink volume. He boots with USB and selects Install Ubuntu alongside Windows 10. 

This setup will be using Windows bootloader and Windows as default OS.

Note from [this](https://www.tecmint.com/install-ubuntu-alongside-with-windows-dual-boot/), that to use Disk Management in Windows you should open it as Administrator.
This guy creates:
- root partition:
    - Size = at least 20000 MB
	- Type for the new partition = Primary
	- Location for the new partition = Beginning
	- Use as = EXT4 journaling file system
	- Mount point = /
- home partition:
    - Size = all remaining free space
	- Type for the new partition = Primary
	- Location for the new partition = Beginning
	- Use as = EXT4 journaling file system
	- Mount point = /home
A pop-up window appears to inform about swap space. He ignores the alert by pressing on the Continue button.
Note that Ubuntu provides NTFS file system support automatically so you can access the files from Windows partitions just by clicking on the Windows volume.
This setup will be using GRUB and Ubuntu as default OS.
Note that I can create just a root partition and a swap partition. It's not necessary to have root, home, swap.
Choose your hard disk "/dev/sda..." for "Device for boot loader Installation" Option.
You might need to install Boot Repair afterwards to fix grub.


**Note when installing Ubuntu, root / partition is highly recommended. You can install Ubuntu without a dedicated /home partition, but it's always recommended to use a separate home.**


####Can we install Ubuntu without a swap area?
- No, you don't need a swap partition, as long as you never run out of RAM your system will work fine without it, but it can come in handy if you have less than 8GB of RAM and it is necessary for hibernation. 
- Swap partitions do two things: they can provide an overall speed boost by freeing up memory for more cache, and they can prevent rare disastrous out-of-memory situations where the system will start killing processes without warning.
- You don't need to use a partition. It is possible to have a swap file instead of a swap partition. Just don't set up any swap partition, and then set up a swap file later.

There is a common misconception that having a swap space is negatively affecting system performance. This is incorrect. As long as you have enough RAM, having a swap area whatever its size doesn't hurt performance at all. What affects performance is being short in RAM and effectively using the swap space.
1. If you have no swap space and happen to be out of RAM, the kernel will pick one or more processes which it thinks are good candidates (although you might give it some hints though) and kill them.
2. If you have a swap space and are out of RAM, the kernel will pick less used memory pages and put them on the swap area to free RAM. This will slow down the system but your applications won't be affected otherwise.
I always prefer case 2. as I feel uncomfortable loosing parts or all of my work because the kernel thinks my applications are worth killing. Moreover, with the current size of an average disk being in the TB range, reserving a few percent for swap is usually not an issue.

####How can i create more partitions if I already have 4 primary?
- You can get around the 4 partition limit by creating an extended partition, and then creating partitions under this one (e.g. a swap partition, a root partition, a home partition). These "sub" partitions appear under the extended partition and are called "logical" partitions.


Fresh install of Windows on entire disk:
---

From [here](https://www.tenforums.com/installation-upgrade/74539-delete-format-partition-during-clean-install-windows.html), I see that I will first delete all partitions to make one drive with uncallocated space.

Note that if the motherboard of your computer doesnt support UEFI, it only supports BIOS. 

If your motherboard only supports BIOS, it won't allow you to install Windows 10 on a GPT partition.

You can check if your PC supports UEFI by restarting and going to boot settings.

It is better if all disks have same partition type i.e. either all MBR or all GPD (to make things easier e.g. with grub). This means the usb devices where you will flash the ISO of Windows or Ubuntu for installations must both be MBR or GPD.

Note that installation of Windows 10 will say it needs GBD partition table. You can see https://www.youtube.com/watch?v=ilZJ2_-zSvA&ab_channel=TechLunar or https://www.youtube.com/watch?v=pb6tECZP6WE&ab_channel=Britec09 on how to convert your disk into GPD. Otherwise you can reboot the PC in legacy BIOS compatibility mode instead of UEFI mode; with this you will be able to install on mbr.

Many PCs now include the ability to use the UEFI version of BIOS, which can speed up boot and shutdown times and can provide additional security advantages. To boot your PC in UEFI mode, you'll need to use a drive formatted using the GPT drive format.
Many PCs are ready to use UEFI, but include a compatibility support module (CSM) that is set up to use the legacy version of BIOS. This version of BIOS was developed in the 1970s and provides compatibility to a variety of older equipment and network configurations, and requires a drive that uses the MBR drive format.
However, the basic MBR drive format does not support drives over 4TB. It's also difficult to set up more than four partitions. The GPT drive format lets you set up drives that are larger than 4 terabytes (TB), and lets you easily set up as many partitions as you need.

Master Boot Record (MBR) disks use the standard BIOS partition table. GUID Partition Table (GPT) disks use Unified Extensible Firmware Interface (UEFI).

You can change a disk from MBR to GPT partition style as long as the disk contains no partitions or volumes.


Whenever we attach a USB drive in Ubuntu, it automatically mounted to the system. We can not format any disk on Linux systems which are already mounted. So first un-mount /dev/sdc1 USB drive on your system.

note that vFAT and NTFS can be easily used on Windows OS

Some Commands
---

- ```df /```
	shows where is the volume that / is mounted from 

- ```df -h``` 
	shows in human readable sizes all the volumes

- ```sudo umount /dev/sdc1```
	un-mounts the usb

- ```sudo mkfs.vfat /dev/sdc1```
	format with vFAT file system

- ```sudo mkfs.ntfs /dev/sdc1```
	format with NTFS file system

- ```sudo mkfs.ext4 /dev/sdc1```
	format with ext4 file system

- ```sudo apt-get install gparted```
	installs the tool called gparted which can format drives. you can open gparted and unmount and format a usb

- ```sudo fdisk -l```
    lists current disks

- ```sudo fdisk /dev/sda```
    allows you to edit the partitions of the /dev/sda disk

note: disable windows fast startup option .. because this enables windows to hibernate .. which causes issues with mounting window partition with full read and write permissions on linux...

NTFS = New Technology File System = first introduced by Microsoft. It is used by Windows. It is supported also in other OS's.

FAT file system = the primary file system in Microsoft's older OS. All Windows still support FAT.

exFAT file system = a newer file system, designed to be used where NTFS doesnt work well, like on flash drives.


------------------------------------------------------------------

ways to restore windows booting:
	1. windows tool: https://www.thewindowsclub.com/repair-master-boot-record-mbr-windows
	2. windows tool: https://neosmart.net/EasyBCD/
	   				 https://askubuntu.com/questions/62440/is-it-possible-to-boot-ubuntu-using-the-windows-bootloader
	3. grub customizer on ubuntu: https://techwiser.com/fix-windows-10-not-booting-up-on-linux/ 

------------------------------------------------------------------

currently:
	/dev/sda1
		524MB, NTFS/exFAT/HPFS, NotMounted, 1EC... (Microsoft basic data)
	/dev/sda2
		264GB, NTFS/exFAT/HPFS, NotMounted, 0AC...  (Microsoft basic data)
	/dev/sda3
		489MB, 0x27, NotMounted, 1CCA... (Windows RE)
	/dev/sda4
		235GB, Extended
		/dev/sda5
			199MB, EFI(FAT12/16/32) (Bootable), NotMounted, 
		/dev/sda6
			8.2GB, Linux swap, , 32db...
		/dev/sda7
			227GB, Linux, Ext4, Mounted at FilesystemRoot, 3f56...
------------------------------------------------------------------

sudo gdisk -l /dev/sda


(You could use virtual machine software instead of setting up a dual-boot system, but a dual-boot system lets you actually use both operating systems on your hardware at full, native speed. You don’t have to deal with the overhead of a virtual machine, which is especially bad when it comes to 3D graphics. The downside is you can only use one of your installed operating systems at a time.)

I read all of the following guides and combined them. (First read them all):
- [Converted the whole disk into GPT](https://www.youtube.com/watch?v=pb6tECZP6WE&ab_channel=Britec09) to be able to install Windows 10 on it.
- [Generated space for Ubuntu installation by shrinking C:](https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/)
- [Generated the recommended partitions](https://itsfoss.com/install-ubuntu-dual-boot-mode-windows/)
- [Made UEFI Ubuntu usb with GPT partitioning using Rufus on Windows](https://www.itzgeek.com/post/how-to-install-ubuntu-20-04-alongside-with-windows-10-in-dual-boot/)
- [Used nouveau.modeset=0 before installing Ubuntu](https://medium.com/@rohan.kuntoji/dual-booting-ubuntu-16-04-18-04-lts-along-side-windows-10-in-asus-rog-strix-gl503vd-fy254t-238bc685d4b2) and during restarting Ubuntu and then [installed nvidia drivers](https://askubuntu.com/questions/747314/is-nomodeset-still-required) - look [here](https://askubuntu.com/questions/1053150/nouveau-modeset0) and [here](https://askubuntu.com/questions/951046/unable-to-install-nvidia-drivers-unable-to-locate-package) too



**NOTE**:
Because of this crazy configuration of having one partition as home(/home) and one partition as root(/) defaut in ubuntu UI is to not let you do things in root except if you use sudo!


/dev/null
---
A special file that’s present in every single Linux system. However, unlike most other virtual files, instead of reading, it’s used to write. Whatever you write to /dev/null will be discarded, forgotten into the void. It’s known as the null device in a UNIX system.

e.g. $ grep -r hello /sys/ 2> /dev/null will write all errors (output code is 2)) in /dev/null instead of printing them in stdout i.e. terminal
e.g. $ ping google.com 1> /dev/null 

note: 
  Exit code 0        Success
  Exit code 1        General errors, Miscellaneous errors, such as "divide by zero" and other impermissible operations
  Exit code 2        Misuse of shell builtins (according to Bash documentation)        Example: empty_function() {}
  
      

# Ubuntu Server Quick Install
# by Dustin Kirkland <kirkland@ubuntu.com>
#  * Documentation: http://bit.ly/uquick-doc

d-i     debian-installer/locale string en_US.UTF-8
d-i     debian-installer/splash boolean false
d-i 	mirror/country string manual
d-i 	mirror/protocol string http
d-i 	mirror/http/hostname string 172.17.11.80:3142
d-i 	mirror/http/directory string /ubuntu
d-i 	mirror/http/proxy string
d-i     console-setup/ask_detect        boolean false
d-i     console-setup/layoutcode        string us
d-i     console-setup/variantcode       string
d-i     netcfg/get_nameservers  string
d-i     netcfg/get_ipaddress    string
d-i     netcfg/get_netmask      string 255.255.255.0
d-i     netcfg/get_gateway      string
d-i     netcfg/confirm_static   boolean true
d-i     netcfg/choose_interface select auto
d-i     netcfg/dhcp_timeout string 60
d-i     clock-setup/utc boolean true
d-i 	partman/early_command string vgs .separator=: .noheadings | cut -f1 -d: | while read vg ; do vgchange -an $vg ; done ; pvs .separator=: .noheadings | cut -f1 -d: | while read pv ; do pvremove -ff -y $pv ; done
d-i     partman-auto/method string lvm
d-i	partman-auto/disk string /dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/cciss/c0d0 /dev/cciss/c0d1 /dev/cciss/c0d2
d-i	partman-auto/choose_recipe select expert_recipe 
d-i 	partman-auto/expert_recipe string                     \
      	openstack ::                                          \
              256 10 256 ext3                                 \
                      $primary{ } $bootable{ }                \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext3 }    \
                      mountpoint{ /boot }                     \
              .                                               \
              2048 10 2048 ext4                               \
                      $lvmok{ } lv_name{ root } $defaultignore{ } \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext4 }    \
                      mountpoint{ / }                         \
              .                                               \
              2048 10 2048 ext4                               \
                      $lvmok{ } $defaultignore{ }\
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext4 }    \
                      mountpoint{ /var }                      \
              .                                               \
              512 10 512 linux-swap                           \
                      $lvmok{ } lv_name{ swap_1 } $defaultignore{ } \
                      method{ swap } format{ }        		\
	      .
d-i     partman-lvm/device_remove_lvm boolean true
d-i     partman-lvm/confirm boolean true
d-i	partman-lvm/confirm_nooverwrite boolean true
d-i 	partman/alignment string cylinder
d-i 	partman-md/device_remove_md boolean true
d-i 	partman-md/confirm boolean true
d-i     partman/choose_partition        select finish
d-i     partman/confirm_write_new_label boolean true
d-i     partman/confirm boolean true
d-i     partman/confirm_nooverwrite boolean true
d-i     partman/default_filesystem string ext4
d-i     clock-setup/utc boolean true
d-i     clock-setup/ntp boolean true
d-i     clock-setup/ntp-server  string ntp.ubuntu.com
d-i     base-installer/kernel/image     string linux-server
d-i     passwd/root-login       boolean false
d-i     passwd/make-user        boolean true
d-i     passwd/user-fullname    string ubuntu
d-i     passwd/username string ubuntu
d-i     passwd/user-password-crypted    password $6$.1eHH0iY$ArGzKX2YeQ3G6U.mlOO3A.NaL22Ewgz8Fi4qqz.Ns7EMKjEJRIW2Pm/TikDptZpuu7I92frytmk5YeL.9fRY4.
d-i     passwd/user-uid string
d-i     user-setup/allow-password-weak  boolean false
d-i     user-setup/encrypt-home boolean false
d-i     passwd/user-default-groups      string adm cdrom dialout lpadmin plugdev sambashare
d-i     apt-setup/services-select       multiselect security
d-i     apt-setup/security_host string security.ubuntu.com
d-i     apt-setup/security_path string /ubuntu
d-i     debian-installer/allow_unauthenticated  string false
d-i     pkgsel/upgrade  select safe-upgrade
d-i     pkgsel/language-packs   multiselect
d-i     pkgsel/update-policy    select none
d-i     pkgsel/updatedb boolean true
d-i 	pkgsel/include string openssh-server ntp less
d-i     grub-installer/skip     boolean false
d-i     lilo-installer/skip     boolean false
d-i     grub-installer/only_debian      boolean true
d-i     grub-installer/with_other_os    boolean true
d-i     finish-install/keep-consoles    boolean false
d-i     finish-install/reboot_in_progress       note
d-i     cdrom-detect/eject      boolean true
d-i     debian-installer/exit/halt      boolean false
d-i 	preseed/late_command string wget -O /target/var/tmp/bootstrap.sh http://172.17.11.80/bootstrap.sh; in-target sh /var/tmp/bootstrap.sh

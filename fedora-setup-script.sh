#! /bin/bash


pkexec bash -c "

dnf remove -y adwaita-qt6 adwaita-qt5 totem gnome-calendar epiphany evolution java-17-openjdk java-17-openjdk-devel gnome-shell-extension-window-list gnome-shell-extension-places-menu gnome-shell-extension-background-logo gnome-contacts gnome-weather gnome-maps gnome-photos mediawriter libreoffice-calc libreoffice-writer libreoffice-impress rhythmbox gnome-tour firefox &&

dnf install -y gnome-tweaks file-roller fragments p7zip-plugins p7zip gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock gnome-shell-extension-system-monitor gnome-shell-extension-user-theme gnome-shell-extension-caffeine gnome-shell-extension-blur-my-shell la-capitaine-cursor-theme fondo gnome-sound-recorder gparted python make cmake automake autoconf gcc g++ adb java-latest-openjdk-devel procyon-decompiler meld ghex gnupg brasero seahorse wget git seahorse-nautilus gvfs-mtp wireshark openssl nodejs npm nautilus-extensions btrfs-progs exfatprogs e2fsprogs f2fs-tools dosfstools mtools hfsutils jfsutils util-linux cryptsetup lvm2 nilfs-utils udftools xfsprogs xfsdump &&

dnf clean packages &&

dnf autoremove -y &&

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

flatpak remote-modify --enable flathub &&

flatpak mask org.kde.KStyle.Adwaita &&

flatpak install flathub -y com.mattjakeman.ExtensionManager com.google.Chrome org.mozilla.firefox org.videolan.VLC com.visualstudio.code org.onlyoffice.desktopeditors &&

alternatives --set java java-latest-openjdk.x86_64 &&

dnf install -y https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm &&

mkdir -p /usr/local/share/fonts && cd /usr/local/share/fonts &&

git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git &&

git clone https://github.com/supercomputra/SF-Mono-Font.git &&

git clone https://github.com/yell0wsuit/New-York-fonts.git &&

git clone https://github.com/aliifam/BlinkMacSystemFont.git &&

mkdir -p /usr/local/share/fonts/Helvetica && cd /usr/local/share/fonts/Helvetica &&

wget https://laplace.physics.ubc.ca/Doc/rnpletal/Helvetica.ttf.gz && gunzip Helvetica.ttf.gz &&

mkdir -p /usr/local/share/fonts/ComicMono && cd /usr/local/share/fonts/ComicMono &&

wget https://dtinth.github.io/comic-mono-font/ComicMono.ttf &&

echo '[org/gnome/shell]
enabled-extensions=[\"appindicatorsupport@rgcjonas.gmail.com\", \"dash-to-dock@micxgx.gmail.com\", \"blur-my-shell@aunetx\", \"caffeine@patapon.info\", \"system-monitor@gnome-shell-extensions.gcampax.github.com\", \"user-theme@gnome-shell-extensions.gcampax.github.com\"]' > /etc/dconf/db/local.d/00-extensions &&
chmod 755 /etc/dconf/db/local.d/00-extensions &&
echo '[org/gnome/desktop/interface]
cursor-theme=\"capitaine-cursors-light\"' > /etc/dconf/db/gdm.d/10-cursor-settings &&
chmod 755 /etc/dconf/db/gdm.d/10-cursor-settings &&
dconf update"

# Use the following commands only for user level settings //
# only when the above root level commands already been executed once to the system.
# But in case of first time usage do not touch any command, execute the whole.

fc-cache -v -f
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
# gsettings set org.gnome.shell enabled-extensions "['appindicatorsupport@rgcjonas.gmail.com', 'dash-to-dock@micxgx.gmail.com', 'blur-my-shell@aunetx', 'caffeine@patapon.info', 'system-monitor@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.desktop.interface document-font-name 'BlinkMacSystemFont 11'
gsettings set org.gnome.desktop.interface font-name 'BlinkMacSystemFont Medium 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Comic Mono 10'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'BlinkMacSystemFont Semibold 11'
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-light'

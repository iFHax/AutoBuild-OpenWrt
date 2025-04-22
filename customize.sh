#!/bin/bash

# Create config folders
mkdir -p openwrt/files/etc/config
mkdir -p openwrt/files/etc

# Set system hostname, timezone
cat <<EOF > openwrt/files/etc/config/system
config system
	option hostname 'DOTYCAT'
	option timezone 'MST-8'
	option zonename 'Asia/Kuala Lumpur'
EOF

# Set default LuCI language to English
cat <<EOF > openwrt/files/etc/config/luci
config core 'main'
	option lang 'en'
EOF

# Change LuCI Web UI title (from LEDE to custom)
sed -i 's/LEDE/DOTYCAT/g' openwrt/package/lean/default-settings/files/zzz-default-settings

# Remove default root password (empty login)
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

# Set custom SSH banner with Dotycat design
curl -s https://raw.githubusercontent.com/intannajwa/Auto_Build/master/banner -o openwrt/files/etc/banner

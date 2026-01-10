#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 1. 移除可能导致冲突的旧版 Rust 源码（如果存在）
rm -rf feeds/packages/lang/rust

# 2. 核心：下载预编译好的 Rust 环境 (由 sbwml 提供，专门针对 OpenWrt 编译优化)
# 这一步能节省约 1 小时的编译时间和 15GB 的空间
curl -fsSL https://raw.githubusercontent.com/sbwml/openwrt_pkgs/main/setup_rust.sh | bash

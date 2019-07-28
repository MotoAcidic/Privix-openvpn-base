#!/usr/bin/env bash
# Copyright (c) 2019 Privix. Released under the MIT License.

RET=$(pgrep openvpn)

if [ $? -eq 1 ]; then
	systemctl restart openvpn@openvpn-server
fi

#!/usr/bin/env bash
# Copyright (c) 2019 Privix. Released under the MIT License.

RET=$(pgrep xl2tpd)

if [ $? -eq 1 ]; then
	systemctl restart xl2tpd
fi

RET=$(pgrep starter)

if [ $? -eq 1 ]; then
	systemctl restart strongswan
fi

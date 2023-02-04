# prometheus-node-exporter-lua-mwan3

MWAN3 metrics exporter for [Prometheus](https://prometheus.io/docs/introduction/overview/) on [OpenWrt](https://openwrt.org/)

## Prerequisite

Install Prometheus node exporter on your OpenWrt distribution. A nice article about that can be found [here](https://grafana.com/blog/2021/02/09/how-i-monitor-my-openwrt-router-with-grafana-cloud-and-prometheus/).

## Installation

Drop mwan3.lua file at prometheus exporter location and restart the prometheus service. *Default /usr/lib/lua/prometheus-collectors/*

## Usage

After the installation, **node_mwan3_interface_*** metrics will be exposed by the exporter.

# `ubuntu` tips

## shell command
### `sudo` based on the current user's PATH
```
$ sudo env "PATH=$PATH"
```

You could add the following to `~/.bash_aliases` for less typing
```
alias sudo=`sudo env PATH=$PATH`
```


## `systemd`

### Switching to a different runlevel
`systemd` emulates runlevels with symbolic links in the `/lib/systemd/system/runlevel?.target`.

You could switch from runlevel5 to runlevel3 by the following command:
```
$ systemctl isolate multi-user.target 
```

or switch reversely
```
$ systemctl isolate graphical.target 
```

### Setting the default runlevel
To set the default runlevel to runlevel3:
```
# systemctl set-default multi-user.target
```


## Devices
The devices can be queried in the `/sys/class` directory. For instance, network devices in your system are under `/sys/class/net`.

## Memory

For more information, refer to [https://www.kernel.org/doc/Documentation/sysctl/vm.txt]


### Releasing clean caches, as well as reclaimable slab objects like dentries and inodes.

```
# sync && echo 3 > /proc/sys/vm/drop_caches
```

## Network

### Fixing the MAC address
The NIC devices of some embedded boards may not have EEPROM to store MAC addresses. The driver of such an NIC device may assign a random MAC address when being loaded. 

The following commands allows the user to set the MAC address of an ethernet device `eth0` to `ca:0f:d1:78:15:f5`: 
```
# ifdown eth0
# ifconfig eth0 hw ether ca:0f:d1:78:15:f5
# ifup eth0
```
You may let the system set this automatically with the following directives in `/etc/network/interfaces`:
```
auto eth0
iface eth0 inet dhcp
hwaddress ether ca:0f:d1:78:15:f5 
```

### Sharing the internet connection of host A with host B
On host A with IP 192.168.0.1:
```
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null
sudo iptables -P FORWARD ACCEPT
sudo iptables -A POSTROUTING -t nat -j MASQUERADE -s 192.168.2.0/24
```

On host B with IP 192.168.0.2:
```
echo "nameserver 192.168.0.1" >> /etc/resolv.conf
```

To turn off the sharing:
```
echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null
sudo iptables -t nat -F POSTROUTING
```

### Enabling WiFi

Install `network-manager` and `nmcli` if they haven't been installed yet:
```bash
$ sudo apt install network-manager nmcli
$ sudo systemctl enable network-manager
```

List available WiFi hotspots:
```bash
$ nmcli d wifi list
```

```bash
$ sudo nmcli d wifi connect <WiFiSSID> password <WiFiPassword> iface <WifiInterface>
```





 


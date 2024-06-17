# Server

### Directory

```
/etc/wireguard/
```

### Server files

```
/etc/wireguard/private.key
/etc/wireguard/public.key
/etc/wireguard/wg0.conf
```

### Server config

```
[Interface]
Address = 10.8.0.1/24
ListenPort = 51820
PrivateKey = <pkey>
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT
PostUp = iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT
PostDown = iptables -t nat -D POSTROUTING -o ens3 -j MASQUERADE
```

### Enable port in firewall

```
sudo ufw allow 51820/udp
sudo ufw allow OpenSSH
```

### Restart firewall

```
sudo ufw disable
sudo ufw enable
sudo ufw status
```

### Start wireguard

```
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0
```

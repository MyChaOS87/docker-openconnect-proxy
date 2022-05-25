# docker-openconnect-proxy
A docker container for using an openconnect VPN via an proxy

## Usage
1. Create a config file `~/.openconnect/config` and `chmod 600 ~/.openconnect/config`
```
# Example Configuration

server=vpn.example.com/examplegroup
user=<YOUR USERNAME>

# As openconnect does not support passing a password via config the password needs to be in a comment ("#password"):
#password=<YOUR PASSCODE>

token-mode=totp
token-secret=base32:<YOUR TOTP SECRET>
```

2. Then fire up the container by `docker compose up` and enjoy your proxy server under `localhost:58443`

3. Use the proxy
```
http_proxy=http://localhost:58443 curl http://example.com

# OR

ssh -o ProxyCommand="nc -x localhost:58443 %h %p" foo@example.com

# OR

google-chrome-beta --proxy-server="socks5://127.0.0.1:58443"
```

## Warning & Alternative Credential Mechanisms
Be AWARE of the security risk of storing clear passwords. An alternative is passing credentials via the environment through docker, read from a passwordmanager like `pass` in an external wrapper script.

The password and secret can be passed via the Environment Variables `OPENCONNECTPROXY_PASSCODE` and `OPENCONNECTPROXY_TOKEN_SECRET` to `docker compose up`

Passing cert files can easily be done by adding to the `volumes` definition in `docker-compose.yml`

## Inspiration 
Inspiration for this came from 
https://github.com/makinacorpus/docker-fortivpn

## License
[MIT](https://github.com/mychaos87/docker-openconnect-proxy/blob/main/LICENSE)
# DCOS local universe creation

1. Clone the repo https://github.com/mesosphere/universe
2. Install python 3, so use "yum provide python3" then install the corresponding package.
3. Install docker and run as daemon
4. Proxy set-up for docker
  
    sudo mkdir -p /etc/systemd/system/docker.service.d
6. Create a file called
    
    /etc/systemd/system/docker.service.d/http-proxy.conf
8. $sudo systemctl daemon-reload
9. $sudo systemctl restart docker
10. $systemctl show --property=Environment docker
11. If you are behind an HTTPS proxy server, then use:
  
    $systemctl show --property=Environment docker
12. Ref : https://docs.docker.com/engine/admin/systemd/#httphttps-proxy
13. Change marathon, config, package & resource json files

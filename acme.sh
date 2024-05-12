#!/usr/bin/env bash
echo "域名为：$1";
base_dir=~/dj-docker
curl  https://get.acme.sh | sh  
cd ~/.acme.sh/  
alias acme.sh=~/.acme.sh/acme.sh 
acme.sh --issue -d $1 --dns --yes-I-know-dns-manual-mode-enough-go-ahead-please  
acme.sh --renew -d $1 --yes-I-know-dns-manual-mode-enough-go-ahead-please  
mkdir -p ${base_dir}/$1
acme.sh --install-cert -d $1 --key-file ${base_dir}/$1/key.pem --fullchain-file ${base_dir}/$1/cert.pem
docker exec -it dj-nginx service nginx reload
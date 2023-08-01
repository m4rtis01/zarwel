while true
do
    if ps -C  xmrig > /dev/null
    then
        echo "xmrig process exists. Killing..." &>/dev/null
        killall xmrig
    else
        echo "."  &>/dev/null
    fi
    history -c
    sleep 1h
done


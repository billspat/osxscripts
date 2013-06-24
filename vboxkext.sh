#!/bin/bash
# simple script to load/unload/stat the kexts used by Virtual Box on Mac
# mac-only
 
kextStubs=( "VBoxUSB" "VBoxNetFlt" "VBoxNetAdp" "VBoxDrv" )

unload() {
    for kext in "${kextStubs[@]}"; do 
        kextstat | grep "org.virtualbox.kext.$kext" > /dev/null 2>&1 && sudo kextunload -b org.virtualbox.kext.$kext
    done
}

load() {
    for kext in "${kextStubs[@]}"; do
        sudo kextload /Library/Extensions/$kext.kext -r /Library/Extensions/
    done
}

status(){
    for kext in "${kextStubs[@]}"; do
        echo "Status of $kext : "
        echo `kextstat -l -b  org.virtualbox.kext.$kext`
    done
    

}


case "$1" in
    unload|remove|stop)
        unload
        ;;
    load|start)
        load
        ;;
    reload)
        unload
        load
        ;;
    *|stat|status)
        status
    ;;
esac
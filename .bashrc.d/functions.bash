### Extract Archives ###
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjvf $1    ;;
            *.tar.gz)    tar xzvf $1    ;;
            *.bz2)       bzip2 -d $1    ;;
            *.rar)       unrar2dir $1    ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip2dir $1     ;;
            *.Z)         uncompress $1    ;;
            *.7z)        7z x $1    ;;
            *.ace)       unace x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()"   ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

compress() {
    if [[ -n "$1" ]]; then
        FILE=$1
        case $FILE in
            *.tar ) shift && tar cf $FILE $* ;;
            *.tar.bz2 ) shift && tar cjf $FILE $* ;;
            *.tar.gz ) shift && tar czf $FILE $* ;;
            *.tgz ) shift && tar czf $FILE $* ;;
            *.zip ) shift && zip $FILE $* ;;
            *.rar ) shift && rar $FILE $* ;;
        esac
    else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
    fi
}

chs(){
    sudo chmod 777 $1 $2
}

#bu - Back Up a file. Usage "bu filename.txt"
bu () {
    cp $1 ${1}-`date +%Y%m%d%H%M`.backup;
}

install(){
    sudo apt-get install -y $1
}

mkcd () {
    mkdir "$1"
    cd "$1"
}

top10() { history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head; }

dirsize () {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

#netinfo - shows network information for your system
netinfo () {
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
    echo "${myip}"
    echo "---------------------------------------------------"
}

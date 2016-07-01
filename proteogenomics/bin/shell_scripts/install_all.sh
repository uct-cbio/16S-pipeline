#!/usr/bin/env bash

peptideshaker='http://genesis.ugent.be/maven2/eu/isas/peptideshaker/PeptideShaker/1.12.1/PeptideShaker-1.12.1.zip'

searchgui='http://genesis.ugent.be/maven2/eu/isas/searchgui/SearchGUI/3.0.2/SearchGUI-3.0.2-mac_and_linux.tar.gz'

denovogui='http://genesis.ugent.be/maven2/com/compomics/denovogui/DeNovoGUI/1.12.0/DeNovoGUI-1.12.0-mac_and_linux.tar.gz'

ruby='https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.5.tar.gz'

#############################
# Create the base directory #
#############################

set -e
dir=$HOME/software
if [ ! -d "$dir" ]; then 
    mkdir $dir
fi 

#################
# PeptideShaker #
#################

url=$peptideshaker
file="${url##*/}"
name="${file%.zip}"
base=$(echo $name | cut -f 1 -d '-')
if [ ! -d "$dir/$base" ]; then 
    mkdir $dir/$base
fi 
cd $dir/$base 
echo $name
if [ ! -d "$name" ]; then 
    wget $url && unzip *.zip && rm -rf *.zip 
fi 

#############
# SearchGUI #
#############

url=$searchgui
file="${url##*/}"
name="${file%-mac_and_linux.tar.gz}"
base=$(echo $name | cut -f 1 -d '-')
if [ ! -d "$dir/$base" ]; then 
    mkdir $dir/$base
fi 
cd $dir/$base 
echo $name
if [ ! -d "$name" ]; then 
    wget $url && tar -zxvf *.tar.gz && rm -rf *.tar.gz
fi 
#############
# DeNovoGUI #
#############

url=$denovogui
file="${url##*/}"
name="${file%-mac_and_linux.tar.gz}"
base=$(echo $name | cut -f 1 -d '-')
if [ ! -d "$dir/$base" ]; then 
    mkdir $dir/$base
fi 
cd $dir/$base 
echo $name
if [ ! -d "$name" ]; then 
    wget $url && tar -zxvf *.tar.gz && rm -rf *.tar.gz
fi 

########
# ruby #
########

url=$ruby
file="${url##*/}"
name="${file%.tar.gz}"
base=$(echo $name | cut -f 1 -d '-')
if [ ! -d "$dir/$base" ]; then 
    mkdir $dir/$base
fi 
cd $dir/$base 
echo $name
if [ ! -d "$name" ]; then 
    mkdir $name && cd $name && wget $url && tar -zxvf *.tar.gz && rm -rf *.tar.gz && mv ruby* tmp && cd tmp  && ./configure --prefix=$dir/$base/$name && make && make install && cd .. && rm -rf tmp  
fi 


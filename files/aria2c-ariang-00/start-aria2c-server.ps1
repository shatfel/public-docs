#!pwsh

## rpc username
$_user="--user-"

## rpc password
$_pass="--password-"

## address to bind 
$_host="--host-"

## bind port
$_port="--port-"

## aria2c winx64 binary
$_aria2c="~/bin/aria2-1.36.0-win-64bit-build1/aria2c"

## aria2c opts
## here max 5 same time downloads and split it on 5 different threads and after try download if unluck
$_aria2cOpts="-x 5 -j 5 -c"

## example
##$_user="admuser"
##$_pass="12345678"
##$_host="0.0.0.0"
##$_port="31386"


## run w/o authentication
& "${_aria2c}"  ${_aria2cOpts}  --enable-rpc 

## uncomment this and comment above to run w/ authentication
##& "${_aria2c}"  ${_aria2cOpts}  --enable-rpc --rpc-user="${_user}" --rpc-pass="${_pass}"

## or same throw token auth
##& "${_aria2c}"  ${_aria2cOpts}  --enable-rpc --rpc-secret="token:${_pass}"

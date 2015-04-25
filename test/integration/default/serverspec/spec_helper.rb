require 'serverspec'
require 'rbconfig'
require 'json'

case RbConfig::CONFIG['host_os']
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  set :backend, :cmd
  set :os, :family => 'windows'
else
  set :backend, :exec
end

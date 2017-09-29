require 'rubygems'
require 'hooke/linker'
require 'bundler'

Gem.post_install do |_installer|
  Hooke::Linker.new.symlink
end

require "rubygems"
require "hooke/linker"
require "bundler"

Gem.post_install do |installer|
  Hooke::Linker.new.symlink
end

# package
include_recipe './cookbooks/packages/default.rb'

# config
include_recipe './cookbooks/config/default.rb'

# source
include_recipe './cookbooks/go/default.rb'
include_recipe './cookbooks/ghq/default.rb'
include_recipe './cookbooks/peco/default.rb'
include_recipe './cookbooks/rust/default.rb'
include_recipe './cookbooks/haskell/default.rb'
include_recipe './cookbooks/ruby/default.rb'
include_recipe './cookbooks/clojure/default.rb'

# dotfiles
include_recipe './cookbooks/dotfiles/default.rb'

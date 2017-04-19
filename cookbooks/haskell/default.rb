package "haskell-stack" do
  user "root"
  action :install
end

execute "Upgrade stack" do
  command "stack upgrade"
end  

execute "Install GHC" do
  command "stack setup"
end  

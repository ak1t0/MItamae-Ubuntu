execute "Install stack" do
  user node[:user]
  command "wget -qO- https://get.haskellstack.org/ | sh"
end

execute "Upgrade stack" do
  command "stack upgrade"
end  

execute "Install GHC" do
  command "stack setup"
end


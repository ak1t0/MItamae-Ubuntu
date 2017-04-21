git "clone dotfiles" do
  user "#{node[:user]}"
  destination "/home/#{node[:user]}/#{node[:dir]}/dotfiles"
  repository "https://github.com/#{node[:user]}/dotfiles.git"
  not_if "test -d /home/#{node[:user]}/#{node[:dir]}/dotfiles"
end

execute "dotfiles setup" do
  user "#{node[:user]}"
  cwd "/home/#{node[:user]}/#{node[:dir]}/dotfiles"
  command "./write.sh"
end

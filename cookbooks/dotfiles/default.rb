git "clone dotfiles" do
  user "#{node[:user]}"
  destination "/home/#{node[:user]}/Works/dotfiles"
  repository "https://github.com/#{node[:user]}/dotfiles.git"
  not_if "test -d /home/#{node[:user]}/Works/dotfiles"
end

execute "dotfiles setup" do
  user "#{node[:user]}"
  cwd "/home/#{node[:user]}/Works/dotfiles"
  command "./write.sh"
end

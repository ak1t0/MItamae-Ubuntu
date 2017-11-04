rb_packages = ["libssl-dev", "libreadline-dev"]

rb_packages.each do |p| 
  package p do
    user "root"
    action :install
  end
end

git "/home/#{node[:user]}/.rbenv" do
  repository "git://github.com/rbenv/rbenv.git"
end

execute "Set PATH" do
  user node[:user]
  command <<-EOC
    echo '# Ruby' >> /home/#{node[:user]}/.profile
    echo 'export PATH=$PATH:$HOME/.rbenv/bin' >> /home/#{node[:user]}/.profile
    echo 'eval \"$(rbenv init -)\"\n' >> /home/#{node[:user]}/.profile
  EOC
end

git "/home/#{node[:user]}/.rbenv/plugins/ruby-build" do
  user "root"
  repository "git://github.com/rbenv/ruby-build.git"
end

execute "Install Ruby" do
  user node[:user]
  command "export PATH=$PATH:$HOME/.rbenv/bin; rbenv install #{node[:versions][:ruby]}"
end

execute "Set Ruby" do
  user node[:user]
  command "export PATH=$PATH:$HOME/.rbenv/bin; rbenv global #{node[:versions][:ruby]}"
end

execute "Download Go" do
  user node[:user]
  cwd "/tmp"
  command "wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz"
end

execute "Decompress" do
  user node[:user]
  cwd "/tmp"
  command "tar xvf go1.8.1.linux-amd64.tar.gz"
end

execute "Install Go" do
  user "root"
  cwd "/tmp"
  command "chown -R root:root ./go; mv ./go /usr/local"
  not_if "test -e /usr/local/go/bin/go"
end

execute "Set PATH" do
  user node[:user]
  command <<-EOC
    echo '# Go' >> /home/#{node[:user]}/.profile
    echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/#{node[:user]}/.profile
    echo 'export GOPATH=$HOME/go' >> /home/#{node[:user]}/.profile
    echo 'export PATH=$PATH:$GOPATH/bin\n' >> /home/#{node[:user]}/.profile
  EOC
end

execute "Install godef" do
  user node[:user]
  command "export PATH=$PATH:/usr/local/go/bin; export GOPATH=$HOME/go; go get -u github.com/rogpeppe/godef"
end

execute "Install lint" do
  user node[:user]
  command "export PATH=$PATH:/usr/local/go/bin; export GOPATH=$HOME/go; go get -u github.com/golang/lint"
end

execute "Install gocode" do
  user node[:user]
  command "export PATH=$PATH:/usr/local/go/bin; export GOPATH=$HOME/go; go get -u github.com/nsf/gocode"
end
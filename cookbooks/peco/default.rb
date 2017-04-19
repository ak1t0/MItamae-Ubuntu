execute "Install peco" do
  user node[:user]
  command "export PATH=$PATH:/usr/local/go/bin; export GOPATH=$HOME/go; go get -u github.com/peco/peco/cmd/peco"
end

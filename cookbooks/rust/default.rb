execute "Intsall rustup" do
  user node[:user]
  cwd "/tmp"
  command <<-EOC
  wget -O \"rustup.sh\" https://sh.rustup.rs
  chmod +x ./rustup.sh
  ./rustup.sh -y
  EOC
end

execute "Set PATH" do
  user node[:user]
  command <<-EOC
    echo '# Rust' >> /home/#{node[:user]}/.profile
    echo 'source $HOME/.cargo/env' >> /home/#{node[:user]}/.profile
  EOC
end

execute "Install rust-src" do
  user node[:user]
  command "export PATH=\"$HOME/.cargo/bin:$PATH\"; rustup component add rust-src"
end

execute "Intsall racer" do
  user node[:user]
  command "export PATH=\"$HOME/.cargo/bin:$PATH\"; cargo install racer --force"
end

execute "Intsall cargo-update" do
  user node[:user]
  command "export PATH=\"$HOME/.cargo/bin:$PATH\"; cargo install cargo-update --force"
end

execute "Install ripgrep"do
  user node[:user]
  command "export PATH=\"$HOME/.cargo/bin:$PATH\"; cargo install ripgrep --force"
end  
  

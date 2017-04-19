execute "Intsall rustup" do
  user node[:user]
  command "$(curl https://sh.rustup.rs -sSf) -y | sh"
end

execute "Set PATH" do
  user node[:user]
  command <<-EOC
    echo '# Rust' >> /home/#{node[:user]}/.profile
    echo 'export PATH="$HOME/.cargo/bin:$PATH\"\n' >> /home/#{node[:user]}/.profile
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
  

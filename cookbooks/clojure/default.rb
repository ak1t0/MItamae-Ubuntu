execute "Download Leiningen script" do
  user "root"
  cwd "/usr/local/bin"
  command "sudo wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod a+x ./lein"
end

execute "Install Leiningen" do
  user node[:user]
  command "lein"
end

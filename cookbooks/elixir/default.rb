ex_packages = ["esl-erlang", "elixir"]

execute "Add esl repository" do
  user node[:user]
  command "echo 'deb http://binaries.erlang-solutions.com/ubuntu bionic contrib' | sudo tee -a /etc/apt/sources.list.d/esl.list"
end

execute "Add esl repository key" do
  user node[:user]
  command "wget -O - http://binaries.erlang-solutions.com/debian/erlang_solutions.asc | sudo apt-key add -"
end

execute "Update repository data" do
  user node[:user]
  command "sudo apt update -y"
end

ex_packages.each do |p| 
  package p do
    user "root"
    action :install
  end
end


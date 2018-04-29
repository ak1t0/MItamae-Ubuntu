py_packages = ["python-pip"]

py_packages.each do |p| 
  package p do
    user "root"
    action :install
  end
end

execute "Install numpy" do
  user node[:user]
  command "pip install numpy"
end

execute "Install pandas" do
  user node[:user]
  command "pip install pandas"
end

execute "Install Jupyter" do
  user node[:user]
  command "pip install jupyter"
end

execute "Install powerline" do
  user node[:user]
  command "pip install powerline-status"
end

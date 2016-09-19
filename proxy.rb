package "git" do
  action :install
end

# git clone
git "./" do
  repository "https://github.com/FIWARE-TMForum/business-ecosystem-logic-proxy.git"
  revision "develop"
  action :sync
end

# npm install
nodejs_npm "biz-ecosys-logic-proxy" do
  path "./business-ecosystem-logic-proxy/"
  json true
end


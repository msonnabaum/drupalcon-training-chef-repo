name              "phpredis"
license           "Apache 2.0"
description       "Installs the PHP redis extension"
version           "1.1.8"

%w{ debian ubuntu centos redhat fedora scientific amazon }.each do |os|
  supports os
end

recipe "phpredis", "Installs phpredis"

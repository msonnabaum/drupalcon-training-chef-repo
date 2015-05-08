name              "drupal"
license           "Apache 2.0"
description       "Extra fun for Drupal"
version           "1.1.8"

%w{ debian ubuntu centos redhat fedora scientific amazon }.each do |os|
  supports os
end

recipe "drupal", "Installs extra configs for Drupal"

actions :create, :delete
default_action :create

attribute :service_name, :kind_of => String
attribute :connect, :required => true
attribute :accept, :required => true
attribute :timeout_close, :kind_of => [TrueClass,FalseClass]

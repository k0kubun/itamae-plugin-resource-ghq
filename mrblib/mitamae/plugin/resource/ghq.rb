module ::MItamae
  module Plugin
    module Resource
      class Ghq < ::MItamae::Resource::Base
        define_attribute :action, default: :create
        define_attribute :repository, type: String, default_name: true
        define_attribute :options, type: String

        self.available_actions = [:create, :update]
      end
    end
  end
end

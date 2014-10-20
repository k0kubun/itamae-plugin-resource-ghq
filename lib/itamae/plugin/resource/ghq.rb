require "itamae/resource/base"

module Itamae
  module Plugin
    module Resource
      class Ghq < Itamae::Resource::Base
        define_attribute :action, default: :create

        def action_create(options)
        end
      end
    end
  end
end

require "itamae/resource/base"

module Itamae
  module Plugin
    module Resource
      class Ghq < Itamae::Resource::Base
        define_attribute :action, default: :create
        define_attribute :repository, type: String, default_name: true

        def set_current_attributes
          super
          ensure_ghq_availability

          result = run_command("ghq list | grep '#{attributes.repository}$'", error: false)
          current.exist = result.exit_status == 0
        end

        def action_create(options)
          unless current.exist
            run_command(["ghq", "get", attributes.repository])
          end
        end

        def action_update(options)
          result = run_command(["ghq", "get", "-u", attributes.repository])
          unless result.stdout.match(/is up to date/)
            updated!
          end
        end

        private

        def ensure_ghq_availability
          if run_command("which ghq", error: false).exit_status != 0
            raise "`ghq` command is not available. Please install ghq."
          end
        end
      end
    end
  end
end

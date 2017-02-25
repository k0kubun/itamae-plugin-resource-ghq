module ::MItamae
  module Plugin
    module ResourceExecutor
      class Ghq < ::MItamae::ResourceExecutor::Base
        def apply
          ensure_ghq_availability

          if !current.exist && desired.exist
            run_command(["ghq", "get", desired.options, desired.repository])
          end

          if desired.exist
            result = run_command(["ghq", "get", "-u", desired.options, desired.repository])
            unless result.stdout.match(/is up to date/)
              updated!
            end
          end
        end

        private

        def set_current_attributes(current, action)
          case action
          when :create
            result = run_command("ghq list | grep '#{desired.repository}$'", error: false)
            current.exist = (result.exit_status == 0)
          end
        end

        def set_desired_attributes(desired, action)
          case action
          when :create, :update
            desired.exist = true
          end
        end

        def ensure_ghq_availability
          if run_command("which ghq", error: false).exit_status != 0
            raise "`ghq` command is not available. Please install ghq."
          end
        end
      end
    end
  end
end

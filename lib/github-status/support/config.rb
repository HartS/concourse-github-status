module Fuselage
  module Support
    module Config
      include ::Contracts::Core
      include ::Contracts::Builtin

      Contract None => Hash
      def config
        @config ||= JSON.load STDIN || {}
        file = File.open('debug', 'a')
        file.write("\n#{@config.to_s}")
        file.close
      end
    end
  end
end

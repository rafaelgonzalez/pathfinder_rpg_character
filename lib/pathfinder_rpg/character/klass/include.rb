module PathfinderRpg
  class Character
    module Klass
      module Include
        attr_reader :klasses

        def level
          klasses.map(&:level).sum || 0
        end

        def attacks_per_round
          klasses.map {|klass| klass.available_attacks}.max || 0
        end

        def add_klass(klass_name, level = 1, favored = false)
          klass_name = klass_name.to_s.camelize.to_sym

          verify_klass_name(klass_name)
          verify_klass_presence(klass_name)

          @klasses.push Klass.full_class_name(klass_name).constantize.new(self, level, favored)
        end

        private

        def verify_klass_name(klass_name)
          available_klasses = Klass.list_names

          unless available_klasses.include? klass_name
            raise ArgumentError.new("Wrong klass name, choose one of the following: #{available_klasses}")
          end
        end

        def verify_klass_presence(klass_name)
          if klasses.any? {|klass| klass.is_a?(Klass.full_class_name(klass_name).constantize) }
            raise ArgumentError.new("This Character already has this klass.")
          end
        end
      end
    end
  end
end

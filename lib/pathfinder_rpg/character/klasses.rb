require 'lib/character/klasses/base'

class Character
  module Klasses
    CLASSES_CONFIG_FILE = 'config/classes.yml'

    attr_reader :klasses

    def self.extended(character)
      character.instance_exec do
        add_klasses_classes_to_namespace
        @klasses = []
      end
    end

    def self.list_names
      Klass.constants.select do |const|
        Klass.const_get(const).is_a? Class
      end.delete_if {|klass_name| klass_name == :Base}
    end

    def self.list_constants
      list_names.map {|klass_name| full_class_name(klass_name).constantize }
    end

    def level
      klasses.map(&:level).sum || 0
    end

    def attacks_per_turn
      klasses.sort_by {|klass| klass.base_attack_bonus.size}.size
    end

    def add_klass(klass_name, level = 1, favored = false)
      klass_name = klass_name.to_s.camelize.to_sym

      verify_klass_name(klass_name)
      verify_klass_presence(klass_name)

      @klasses.push full_class_name(klass_name).constantize.new(self, level, favored)
    end

    private

    def add_klasses_classes_to_namespace
      klasses_config = YAML.load_file(CLASSES_CONFIG_FILE)['classes']

      klasses_config.keys.each do |klass_name|
        unless Character::Klass.const_defined? klass_name.camelize
          create_klass_class(klass_name.camelize, klasses_config[klass_name])
        end
      end
    end

    def create_klass_class(klass_name, klass_config)
      klass = Character::Klass.const_set(klass_name, Class.new(Klass::Base))
      klass.const_set('KLASS_CONFIG', klass_config)
      klass.send(:define_method, :configuration) { klass::KLASS_CONFIG }
    end

    def verify_klass_name(klass_name)
      available_klasses = Klasses.list_names

      unless available_klasses.include? klass_name
        raise ArgumentError.new("Wrong klass name, choose one of the following: #{available_klasses}")
      end
    end

    def verify_klass_presence(klass_name)
      if klasses.any? {|klass| klass.is_a?(full_class_name(klass_name).constantize) }
        raise ArgumentError.new("This Character already has this klass.")
      end
    end

    def full_class_name(klass_name)
      "Character::Klass::#{klass_name}"
    end
  end
end

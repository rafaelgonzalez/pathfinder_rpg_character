require 'pathfinder_rpg/character/klass/base'
require 'pathfinder_rpg/character/klass/include'

module PathfinderRpg
  class Character
    module Klass
      CLASSES_CONFIG_FILE = 'config/classes.yml'

      def self.init!
        add_klasses_classes_to_namespace
      end

      def self.list_names
        Klass.constants.select do |const|
          Klass.const_get(const).is_a? Class
        end.delete_if {|klass_name| klass_name == :Base}
      end

      def self.list
        list_names.map {|klass_name| full_class_name(klass_name).constantize }
      end

      private

      def self.add_klasses_classes_to_namespace
        klasses_config = YAML.load_file(CLASSES_CONFIG_FILE)['classes']

        klasses_config.keys.each do |klass_name|
          unless PathfinderRpg::Character::Klass.const_defined? klass_name.camelize
            create_klass_class(klass_name.camelize, klasses_config[klass_name])
          end
        end
      end

      def self.create_klass_class(klass_name, klass_config)
        klass = PathfinderRpg::Character::Klass.const_set(klass_name, Class.new(Klass::Base))
        klass.const_set('LEVELS', klass_config['levels'])

        klass.send(:define_singleton_method, :available_alignments) { klass_config['alignements'].to_a }
        klass.send(:define_singleton_method, :hit_die) { klass_config['hit_die'] }
        klass.send(:define_singleton_method, :skill_ranks_per_level) { klass_config['skill_ranks_per_level'] }
      end

      def self.full_class_name(klass_name)
        "PathfinderRpg::Character::Klass::#{klass_name}"
      end
    end
  end
end

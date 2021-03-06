require 'pathfinder_rpg/character/skill/base'

module PathfinderRpg
  class Character
    module Skills
      module Model
        attr_accessor :skills
      end

      SKILLS_CONFIG_FILE = 'config/skills.yml'

      def self.init!
        add_skills_classes_to_namespace
      end

      def self.add_skills_to_character(character)
        character.skills = []

        Skills.list.each do |skill_class|
          character.skills.push skill_class.new(character)
        end
      end

      def self.list
        list = Skill.constants.select do |const|
          Skill.const_get(const).is_a? Class
        end.delete_if {|skill_name| skill_name == :Base}

        list.map {|skill_name| "PathfinderRpg::Character::Skill::#{skill_name}".constantize }
      end

      private

      def self.add_skills_classes_to_namespace
        skills_config = YAML.load_file(SKILLS_CONFIG_FILE)['skills']

        skills_config.keys.each do |skill_name|
          unless PathfinderRpg::Character::Skill.const_defined? skill_name.camelize
            create_skill_class(skill_name.camelize, skills_config[skill_name])
          end
        end
      end

      def self.create_skill_class(skill_class_name, skill_config)
        klass = PathfinderRpg::Character::Skill.const_set(skill_class_name, Class.new(Skill::Base))
        klass.const_set('SKILL_CONFIG', skill_config)
        klass.send(:define_method, :configuration) { klass::SKILL_CONFIG }
      end
    end
  end
end

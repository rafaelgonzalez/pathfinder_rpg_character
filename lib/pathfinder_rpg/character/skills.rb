require 'pathfinder_rpg/character/skills/base'

class PathfinderRpg::Character
  module Skills
    SKILLS_CONFIG_FILE = 'config/skills.yml'

    attr_reader :skills

    def self.extended(character)
      character.instance_exec do
        add_skills_classes_to_namespace

        initialize_skills_instances
      end
    end

    private

    def add_skills_classes_to_namespace
      skills_config = YAML.load_file(SKILLS_CONFIG_FILE)['skills']

      skills_config.keys.each do |skill_name|
        unless PathfinderRpg::Character::Skill.const_defined? skill_name.camelize
          create_skill_class(skill_name.camelize, skills_config[skill_name])
        end
      end
    end

    def create_skill_class(skill_class_name, skill_config)
      klass = PathfinderRpg::Character::Skill.const_set(skill_class_name, Class.new(Skill::Base))
      klass.const_set('SKILL_CONFIG', skill_config)
      klass.send(:define_method, :configuration) { klass::SKILL_CONFIG }
    end

    def skills_list
      list = Skill.constants.select do |const|
        Skill.const_get(const).is_a? Class
      end.delete_if {|skill_name| skill_name == :Base}

      list.map {|skill_name| "PathfinderRpg::Character::Skill::#{skill_name}".constantize }
    end

    def initialize_skills_instances
      @skills = []

      skills_list.each do |skill_class|
        @skills.push skill_class.new(self)
      end
    end
  end
end

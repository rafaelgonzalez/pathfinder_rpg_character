class Character
  module Race
    def self.list_available
      Race.constants.select do |const|
        Race.const_get(const).is_a? Module
      end
    end
  end
end

require 'lib/character/sizes'

require 'lib/character/races/dwarf'
require 'lib/character/races/elf'
require 'lib/character/races/empty'
require 'lib/character/races/gnome'
require 'lib/character/races/half_elf'
require 'lib/character/races/half_orc'
require 'lib/character/races/halfling'
require 'lib/character/races/human'

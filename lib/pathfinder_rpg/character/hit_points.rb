module PathfinderRpg
  class Character
    class HitPoints
      attr_accessor :base, :damage

      def initialize(character)
        @character = character

        @damage = 0
        @base = 0
      end

      def maximum
        base + character.constitution_modifier
      end

      def current
        maximum - damage
      end

      def unconscious?
        current <= 0 && !dead?
      end

      def dead?
        current <= -character.constitution
      end
    end
  end
end


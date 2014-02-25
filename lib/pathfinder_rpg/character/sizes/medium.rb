class PathfinderRpg::Character
  module Size
    module Medium
      def size
        PathfinderRpg::Character::Size::Medium
      end

      def self.label
        'medium'
      end

      def self.letter
        'M'
      end

      def self.modifier
        0
      end

      def self.special_modifier
        0
      end
    end
  end
end

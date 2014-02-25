class PathfinderRpg::Character
  module Size
    module Small
      def size
        PathfinderRpg::Character::Size::Small
      end

      def self.label
        'small'
      end

      def self.letter
        'S'
      end

      def self.modifier
        1
      end

      def self.special_modifier
        -1
      end
    end
  end
end

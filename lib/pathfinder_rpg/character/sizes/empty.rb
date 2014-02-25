class PathfinderRpg::Character
  module Size
    module Empty
      def size
        PathfinderRpg::Character::Size::Empty
      end

      def self.name
        nil
      end

      def self.letter
        nil
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

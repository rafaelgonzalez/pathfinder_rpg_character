class Character
  module Race
    module Empty
      extend Character::Size::Empty

      def race
        Character::Race::Empty
      end
    end
  end
end

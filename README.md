# Pathfinder Rpg Character [![Build Status](https://travis-ci.org/rafaelgonzalez/pathfinder_rpg_character.png?branch=master)](https://travis-ci.org/rafaelgonzalez/pathfinder_rpg_character)

Pathfinder Rpg Character is designed to help create [Pathfinder](http://paizo.com/prd/) characters programatically and painlessly, handling as many core rules as possible for you.

**This is still in early alpha and undergoing development.**

## Installation

Add this line to your application's Gemfile:

    gem 'pathfinder_rpg_character'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pathfinder_rpg_character

## Usage

Create a character:

```ruby
character = PathfinderRpg::Character.new
```

Select a race:

```ruby
# Choose among :dwarf, :elf, :half_elf, :gnome, :half_orc, :halfling, :human
character.set_race(:dwarf)
```

Add a class (classes are named klasses):

```ruby
# Character#add_klass(class_name, level, favored?)
character.add_klass(:barbarian, 1)
```

Modify ability scores:

```ruby
character.strength = 16
character.constitution = 13
character.dexterity = 11
character.intelligence = 7
character.wisdom = 9
character.charisma = 10
```

And get their modifiers:

```ruby
character.strength_modifier
character.constitution_modifier
character.dexterity_modifier
character.intelligence_modifier
character.wisdom_modifier
character.charisma_modifier
```

Armor class:

```ruby
character.armor_class.total
character.armor_class.flat_footed
character.armor_class.touch
```

Get saving throws:

```ruby
character.saving_throws.fortitude
character.saving_throws.reflex
character.saving_throws.will
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

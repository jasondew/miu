require "rubygems"
require "bundler/setup"

module MIU

  def self.search_for target, initial="MI", depth=5
    build_tree(initial, depth).each do |node|
      return node if node.name == target
    end

    nil
  end

  def self.build_tree string, depth=5
    Tree::TreeNode.new(string).tap do |root_node|
      all_transforms_for(string).each do |new_string|
        if depth > 1
          root_node << build_tree(new_string, depth - 1)
        else
          root_node << Tree::TreeNode.new(new_string)
        end
      end
    end
  end

  def self.all_transforms_for string
    Rule.all.map do |rule|
      rule.transform string if rule.applies? string
    end.flatten.compact.uniq
  end

  class Rule

    @@all = []

    def self.inherited subclass
      @@all << subclass
    end

    def self.all
      @@all
    end

  end

  class RuleOne < Rule

    def self.applies? string
      string[-1] == "I"
    end

    def self.transform string
      [string + "U"]
    end

  end

  class RuleTwo < Rule

    def self.applies? string
      string[0] == "M"
    end

    def self.transform string
      [string + string[1..-1]]
    end

  end

  class RuleThree < Rule

    def self.applies? string
      string =~ /III/
    end

    def self.transform string
      answers = []

      string.length.times do |index|
        if string[index..index + 2] == "III"
          answer = string.dup
          answer[index..index + 2] = "U"
          answers << answer
        end
      end

      answers
    end

  end

  class RuleFour < Rule

    def self.applies? string
      string =~ /UU/
    end

    def self.transform string
      answers = []

      string.length.times do |index|
        if string[index..index + 1] == "UU"
          answer = string.dup
          answer[index..index + 1] = ""
          answers << answer
        end
      end

      answers
    end

  end

end

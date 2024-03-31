# frozen_string_literal: true

# Created class pair for class HashMap
class Pair
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def retrieve_pair
    [key, value]
  end
end

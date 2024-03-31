# frozen_string_literal: true

require 'linked-list'
require_relative 'pair'

# Hash map class
class HashMap
  @@load_factor = 0.82

  attr_reader :capacity, :array_map, :length

  def initialize
    @capacity = 16
    @length = 0
    @array_map = Array.new(capacity) { LinkedList::List.new }
  end

  def set(key, value)
    return update_value(key, value) if has?(key)

    get_list(key).push(Pair.new(key, value))
    @length += 1
    bucket_grow if needed_grow?
  end

  def get(key)
    get_list(key).each { |val| return val.value if val.key == key }
  end

  def has?(key)
    get_list(key).each { |val| return true if val.key == key }
    false
  end

  def remove(key)
    removed_el = nil
    get_list(key).delete { |val| removed_el = val.key if val.key == key }
    @length -= 1 unless removed_el.nil?
    removed_el
  end

  def clear
    @length = 0
    array_map.each { |list| list.delete_all { |_el| true } }
  end

  def keys
    array_map.flat_map { |list| collect_keys(list) }
  end

  def values
    array_map.flat_map { |list| collect_values(list) }
  end

  def entries
    array_map.flat_map { |list| collect_entries(list) }
  end

  private

  def get_list(key)
    array_map[hash_idx(key)]
  end

  def hash_idx(key)
    hash(key) % capacity
  end

  def hash(key)
    prime_number = 31
    key.each_char.inject(0) { |hash_code, char| prime_number * hash_code + char.ord }
  end

  def update_value(key, value)
    get_list(key).each { |pair| return pair.value = value if pair.key == key }
  end

  def collect_keys(list)
    list_keys = []
    list.each { |pair| list_keys << pair.key }
    list_keys
  end

  def collect_values(list)
    list_values = []
    list.each { |pair| list_values << pair.value }
    list_values
  end

  def collect_entries(list)
    list_entries = []
    list.each { |pair| list_entries << pair.retrieve_pair }
    list_entries
  end

  def needed_grow?
    length >= capacity * @@load_factor
  end

  def bucket_grow
    prev_entries = entries

    clear
    @capacity *= 2
    @array_map = Array.new(capacity) { LinkedList::List.new }

    prev_entries.each { |entry| set(*entry) }
  end
end

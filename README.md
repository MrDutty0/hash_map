# hash_map

## Introduction
As part of the Ruby Course in The Odin Project, I'll be implementing my own version of a hash map in Ruby. In addition to the main functionality, I've also written some helper functions to aid in the implementation process.

**Note:** This implementation is solely for educational purposes and may not cover all edge cases found in production-grade hash maps. Additionally, please note that this hash map implementation only works for keys of type string. This limitation is set to simplify the project scope.

## Assignment
Start by creating a `HashMap` class with the following methods:

- `#hash(key)`: Generates a hash code for the given key.
- `#set(key, value)`: Assigns a value to the given key.
- `#get(key)`: Retrieves the value associated with the given key.
- `#has(key)`: Checks if the given key exists in the hash map.
- `#remove(key)`: Removes the entry with the given key.
- `#length`: Returns the number of stored keys in the hash map.
- `#clear`: Removes all entries in the hash map.
- `#keys`: Returns an array containing all the keys in the hash map.
- `#values`: Returns an array containing all the values in the hash map.
- `#entries`: Returns an array containing each key-value pair.

# Ported from [wikipedia](https://en.wikipedia.org/wiki/MurmurHash)
module Murmur3cr32b
  extend self
  
  def hash_32b(bytes : Indexable(UInt8), seed : UInt32) : UInt32
    blocks = bytes.size // 4

    c1 = 0xcc9e2d51
    c2 = 0x1b873593
    r1 = 15
    r2 = 13
    m = 5
    n = 0xe6546b64
    hash = seed

    bytes.in_groups_of(4, reuse: true) do |block|
      k = block.reverse.reduce(0u32) { |a, e| a << 8 | (e || 0) }
      k = k &* c1
      k = (k << 15) | (k >> 17)
      k = k &* c2
      hash = hash ^ k

      if blocks != 0
        hash = (hash << 13) | (hash >> 19)
        hash = hash &* m &+ n
      end

      blocks -= 1
    end

    hash = hash ^ bytes.size
    hash = hash ^ (hash >> 16)
    hash = hash &* 0x85ebca6b
    hash = hash ^ (hash >> 13)
    hash = hash &* 0xc2b2ae35
    hash = hash ^ (hash >> 16)
    hash
  end
end

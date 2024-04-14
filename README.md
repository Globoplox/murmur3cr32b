# murmur3cr32b

By the book pure crystal implementation of the 32 bit variant of [MurmurHash3](https://en.wikipedia.org/wiki/MurmurHash)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     murmur3cr32b:
       github: globoplox/murmur3cr32b
   ```

2. Run `shards install`

## Usage

```crystal
require "murmur3cr32b"

hash : UInt32 = MurmurHash3.hash_32b "text to hash".bytes, seed: Random::DEFAULT.next_u
```

## Contributors

- [globoplox](https://github.com/globoplox) - creator and maintainer

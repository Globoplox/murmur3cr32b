require "./spec_helper"

# Tests have been taken from [wikipedia](https://en.wikipedia.org/wiki/MurmurHash)
describe Murmur3cr32b do
  
  it "Produce the right hash" do
    Murmur3cr32b.hash_32b("".bytes, 0x00000000u32,).should eq 0x00000000u32
    Murmur3cr32b.hash_32b("".bytes, 0x00000001u32,).should eq 0x514E28B7u32
    Murmur3cr32b.hash_32b("".bytes, 0xffffffffu32,).should eq 0x81F16F39u32
    Murmur3cr32b.hash_32b("test".bytes, 0x00000000u32,).should eq 0xba6bd213u32
    Murmur3cr32b.hash_32b("test".bytes, 0x9747b28cu32,).should eq 0x704b81dcu32
    Murmur3cr32b.hash_32b("Hello, world!".bytes, 0x00000000u32,).should eq 0xc0363e43u32
    Murmur3cr32b.hash_32b("Hello, world!".bytes, 0x9747b28cu32,).should eq 0x24884CBAu32
    Murmur3cr32b.hash_32b("The quick brown fox jumps over the lazy dog".bytes, 0x00000000u32,).should eq 0x2e4ff723u32
    Murmur3cr32b.hash_32b("The quick brown fox jumps over the lazy dog".bytes, 0x9747b28cu32,).should eq 0x2FA826CDu32
  end
end

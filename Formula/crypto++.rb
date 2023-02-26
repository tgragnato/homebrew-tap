class Cryptoxx < Formula
  desc "Free C++ class library of cryptographic schemes"
  homepage "https://cryptopp.com/"
  url "https://github.com/weidai11/cryptopp.git"
  version "20230226"
  license "BSL-1.0"

  def install
    system "PREFIX=#{prefix} make"
    system "PREFIX=#{prefix} make install"
  end
end

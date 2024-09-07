class Cryptoxx < Formula
  desc "Free C++ class library of cryptographic schemes"
  homepage "https://cryptopp.com/"
  url "https://github.com/weidai11/cryptopp.git",
    tag:      "CRYPTOPP_8_9_0",
    revision: "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
  license "BSL-1.0"

  def install
    system "PREFIX=#{prefix} make"
    system "PREFIX=#{prefix} make install"
  end
end

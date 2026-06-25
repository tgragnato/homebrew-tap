class Amule < Formula
  desc "'All-platform' P2P client based on eMule"
  homepage "https://github.com/amule-org/amule"
  url "https://github.com/amule-org/amule/archive/refs/tags/3.0.1.tar.gz"
  sha256 "29bb7694479417f55a1b1d04f3c98dff25853be14592fb0a1e49da1d93c143b3"
  version "3.0.1"
  license "GPL-2.0"

  head "https://github.com/tgragnato/amule.git", branch: "main"

  stable do
    depends_on "libmaxminddb"
    depends_on "libupnp"
  end

  depends_on "cmake" => [:build, :test]
  depends_on "gettext" => [:build, :test]
  depends_on "boost"
  depends_on "cryptopp"
  depends_on "wxwidgets"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "cmake", "--build", "unittests"
    system "./unittests/tests/CTagTest"
    system "./unittests/tests/FormatTest"
    system "./unittests/tests/RangeMapTest"
    system "./unittests/tests/CUInt128Test"
    system "./unittests/tests/NetworkFunctionsTest"
    system "./unittests/tests/StringFunctionsTest"
    system "./unittests/tests/FileDataIOTest"
    system "./unittests/tests/PathTest"
    system "./unittests/tests/TextFileTest"
  end
end

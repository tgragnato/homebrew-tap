class Amule < Formula
  desc "'All-platform' P2P client based on eMule"
  homepage "https://github.com/tgragnato/amule"
  url "https://github.com/tgragnato/amule.git", branch: "main"
  version "20230807"
  license "GPL-2.0"

  depends_on "cmake" => [:build, :test]
  depends_on "gettext" => [:build, :test]
  depends_on "crypto++"
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

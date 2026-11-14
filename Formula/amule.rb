class Amule < Formula
  desc "'All-platform' P2P client based on eMule"
  homepage "https://github.com/tgragnato/amule"
  url "https://github.com/tgragnato/amule.git",
    branch:   "main",
    revision: "96c01d2b2bc9d8ef96f90b0500b2453323b84f38"
  version "20261114"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://api.github.com/repos/tgragnato/amule/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "cryptopp"
  depends_on "gettext"
  depends_on "readline"
  depends_on "wxwidgets"

  on_linux do
    depends_on "curl"
    depends_on "glib"
  end

  def install
    args = %w[
      -DBUILD_MONOLITHIC=ON
      -DBUILD_DAEMON=ON
      -DBUILD_REMOTEGUI=ON
      -DBUILD_AMULECMD=ON
      -DBUILD_AMULEAPI=ON
      -DBUILD_ED2K=ON
      -DBUILD_TESTING=OFF
      -DENABLE_CCACHE=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "aMule ED2k link parser", shell_output("#{bin}/ed2k --version")
    %w[amule amuled amulegui amulecmd amuleapi].each do |program|
      assert_path_exists bin/program
    end
  end
end

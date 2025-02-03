class Magnetico < Formula
  desc "Autonomous (self-hosted) BitTorrent DHT search engine suite"
  homepage "https://github.com/tgragnato/magnetico/"
  url "https://github.com/tgragnato/magnetico.git",
    tag:      "v2.1.0",
    revision: "9c1ef7852cc68052d2eb56d0486b05b310716743"
  license "AGPL-3.0-only"

  depends_on "czmq" => :build
  depends_on "go" => :build
  depends_on "libsodium" => :build
  depends_on "lz4" => :build
  depends_on "pkg-config" => :build
  depends_on "zeromq" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"magnetico", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"magnetico", "--help"
  end
end

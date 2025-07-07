class Magnetico < Formula
  desc "Autonomous (self-hosted) BitTorrent DHT search engine suite"
  homepage "https://github.com/tgragnato/magnetico/"
  url "https://github.com/tgragnato/magnetico.git",
    tag:      "v2.3.0",
    revision: "b60f573922b76fe78f39830fdc5d5cd52727ffe6"
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

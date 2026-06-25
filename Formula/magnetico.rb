class Magnetico < Formula
  desc "Autonomous (self-hosted) BitTorrent DHT search engine suite"
  homepage "https://github.com/tgragnato/magnetico/"
  url "https://github.com/tgragnato/magnetico.git",
    tag:      "v2.4.0",
    revision: "a763a2ec7a24fbe1a11711cda9a5be22aa2b23da"
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

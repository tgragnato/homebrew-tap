class Magnetico < Formula
  desc "Autonomous (self-hosted) BitTorrent DHT search engine suite"
  homepage "https://github.com/tgragnato/magnetico/"
  url "https://github.com/tgragnato/magnetico.git",
    tag:      "v1.61.2",
    revision: "5ed053c9c2d38c6650bc6ba22935326dc6d3b378"
  license "AGPL-3.0-only"

  depends_on "czmq" => :build
  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"magnetico", "."
  end

  test do
    system "go", "test", "./..."
    system "#{bin}/magnetico", "--version"
  end
end

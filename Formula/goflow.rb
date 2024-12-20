class Goflow < Formula
  desc "High-scalability sFlow/NetFlow/IPFIX collector used internally at Cloudflare"
  homepage "https://github.com/tgragnato/goflow/"
  url "https://github.com/tgragnato/goflow.git",
    tag:      "v0.5.0",
    revision: "52065c5d8decb2b7ed9b2163f5cda9989406600f"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"goflow", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"goflow", "--help"
  end
end

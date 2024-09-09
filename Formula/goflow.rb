class Goflow < Formula
  desc "High-scalability sFlow/NetFlow/IPFIX collector used internally at Cloudflare"
  homepage "https://github.com/tgragnato/goflow/"
  url "https://github.com/tgragnato/goflow.git",
    tag:      "v0.2.0",
    revision: "0eca2c61a6d5d68da4cc0a7264773624afb93437"
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

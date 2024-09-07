class Goflow < Formula
  desc "High-scalability sFlow/NetFlow/IPFIX collector used internally at Cloudflare"
  homepage "https://github.com/tgragnato/goflow/"
  url "https://github.com/tgragnato/goflow.git",
    tag:      "v0.1.0",
    revision: "aa9cff987c2ba3d130e2e6779ccfd41ce0e324ac"
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

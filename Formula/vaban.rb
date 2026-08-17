class Vaban < Formula
  desc "Simple and Really Fast Varnish Cache Cluster Manager (for Varnish 6.x/7.x)"
  homepage "https://github.com/tgragnato/vaban/"
  url "https://github.com/tgragnato/vaban.git",
    tag:      "v2.0.0",
    revision: "eb3ef7164e723d7a86426b352a1eec52dd8a9988"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"vaban", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"vaban", "--help"
  end
end

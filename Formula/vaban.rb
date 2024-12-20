class Vaban < Formula
  desc "Simple and Really Fast Varnish Cache Cluster Manager (for Varnish 6.x/7.x)"
  homepage "https://github.com/tgragnato/vaban/"
  url "https://github.com/tgragnato/vaban.git", branch: "main"
  version "20241220"
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

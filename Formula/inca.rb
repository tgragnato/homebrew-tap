class Inca < Formula
  desc "API around internal and global Certificate Authority flows"
  homepage "https://github.com/immobiliare/inca/"
  url "https://github.com/immobiliare/inca.git",
    tag:      "1.9.0",
    revision: "0d24f1a8415517350f0347873595b659f8646183"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"inca", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"inca", "--help"
  end
end

class Inca < Formula
  desc "API around internal and global Certificate Authority flows"
  homepage "https://github.com/immobiliare/inca/"
  url "https://github.com/immobiliare/inca.git",
    tag:      "1.6.0",
    revision: "0b5f9ffe58db1b1f12d8159a3c18c38a3a9fbfc3"
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

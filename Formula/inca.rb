class Inca < Formula
  desc "API around internal and global Certificate Authority flows"
  homepage "https://github.com/immobiliare/inca/"
  url "https://github.com/immobiliare/inca.git",
    tag:      "1.8.1",
    revision: "3aa1a6b6dd0227040fb64ea44b12cc990b0d71e6"
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

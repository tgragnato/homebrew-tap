class Inca < Formula
  desc "API around internal and global Certificate Authority flows"
  homepage "https://github.com/immobiliare/inca/"
  url "https://github.com/immobiliare/inca.git",
    tag:      "1.7.0",
    revision: "df16c2bac76d48f07e10feb570f25019c0628107"
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

class Peephole < Formula
  desc "SaltStack transactions tracker"
  homepage "https://github.com/immobiliare/peephole/"
  url "https://github.com/immobiliare/peephole.git",
    tag:      "0.5.0",
    revision: "9f4f412d26e524d75482cdb33abd41251c68e570"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"peephole", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"peephole", "--help"
  end
end

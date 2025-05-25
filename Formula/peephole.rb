class Peephole < Formula
  desc "SaltStack transactions tracker"
  homepage "https://github.com/immobiliare/peephole/"
  url "https://github.com/immobiliare/peephole.git",
    tag:      "0.5.1",
    revision: "bc504466b2b0316e515734856640b1b24c50562f"
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

class Gotools < Formula
  desc "Tools for working with Go source code"
  homepage "https://pkg.go.dev/golang.org/x/tools"
  url "https://github.com/golang/tools/archive/refs/tags/v0.49.0.tar.gz"
  sha256 "df7f087706730d85ced76f5f2e3d1a51703de3beb305acc72d1170d405f5a21e"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    bin.mkpath
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin, "./cmd/..."
  end

  test do
    assert_match "usage", shell_output("#{bin}/goyacc 2>&1", 2)
    assert_match "stringer", shell_output("#{bin}/stringer 2>&1", 2)
  end
end

class Gotools < Formula
  desc "Tools for working with Go source code"
  homepage "https://pkg.go.dev/golang.org/x/tools"
  url "https://github.com/golang/tools/archive/refs/tags/v0.49.0.tar.gz"
  sha256 "df7f087706730d85ced76f5f2e3d1a51703de3beb305acc72d1170d405f5a21e"
  license "BSD-3-Clause"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    bin.mkpath
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin, "./cmd/..."
  end

  test do
    exit0 = %w[
      bundle callgraph deadcode fiximports fuzz-driver fuzz-runner
      go-contrib-init gomvpkg goyacc html2article present ssadump stress stringer
    ]
    exit1 = %w[splitdwarf]
    exit2 = %w[
      benchcmp bisect compilebench digraph eg file2fuzz godex
      goimports gonew gotype present2md toolstash
    ]

    (exit0 + exit1 + exit2).each { |cmd| assert_path_exists bin/cmd }
    exit0.each { |cmd| system bin/cmd, "--help" }
    exit1.each { |cmd| shell_output("#{bin}/#{cmd} --help 2>&1", 1) }
    exit2.each { |cmd| shell_output("#{bin}/#{cmd} --help 2>&1", 2) }
  end
end

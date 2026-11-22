class Derp418 < Formula
  desc "Tailnet-only DERP relay with wildcard hosts and Let's Encrypt certificates"
  homepage "https://github.com/tgragnato/Derp418/"
  url "https://github.com/tgragnato/Derp418.git",
    branch:   "main",
    revision: "c990264b033abdc9c18a294eaf775ca4b8551ef2"
  version "20261116"
  license "AGPL-3.0-only"

  livecheck do
    url "https://api.github.com/repos/tgragnato/Derp418/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"derp418", "."
  end

  test do
    system bin/"derp418", "--version"
  end
end

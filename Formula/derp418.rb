class Derp418 < Formula
  desc "Tailnet-only DERP relay with wildcard hosts and Let's Encrypt certificates"
  homepage "https://github.com/tgragnato/Derp418/"
  url "https://github.com/tgragnato/Derp418.git",
    branch:   "main",
    revision: "28e49f4a18a9ca607044e793a2a4cf45f6930c68"
  version "20261022"
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

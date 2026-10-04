class Orbiter < Formula
  desc "Read and send metrics from whisper files to Graphite"
  homepage "https://github.com/tgragnato/orbiter/"
  url "https://github.com/tgragnato/orbiter.git", branch: "main"
  version "20260930"
  license "AGPL-3.0-only"

  livecheck do
    url "https://api.github.com/repos/tgragnato/orbiter/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"orbiter", "."
  end

  test do
    output = shell_output("#{bin}/orbiter --help 2>&1", 1)
    assert_match "Usage of orbiter:", output
  end
end

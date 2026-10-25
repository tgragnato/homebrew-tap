class SnowflakePt < Formula
  desc "WebRTC Pluggable Transport"
  homepage "https://github.com/tgragnato/snowflake/"
  url "https://github.com/tgragnato/snowflake.git",
    branch:   "main",
    revision: "e2df78bdb639f3f8e2e41abef82b2da150f0f355"
  version "20261025"
  license "BSD-3-Clause"

  livecheck do
    url "https://api.github.com/repos/tgragnato/snowflake/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"snowflake_client", "./client"
    system "go", "build", *std_go_args, "-o", bin/"snowflake_proxy", "./proxy"
  end

  test do
    system "go", "test", "./..."
    system bin/"snowflake_client", "--help"
    system bin/"snowflake_proxy", "--help"
  end
end

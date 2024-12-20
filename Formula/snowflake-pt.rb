class SnowflakePt < Formula
  desc "WebRTC Pluggable Transport"
  homepage "https://github.com/tgragnato/snowflake/"
  url "https://github.com/tgragnato/snowflake.git", branch: "main"
  version "20241220"
  license "BSD-3-Clause"

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

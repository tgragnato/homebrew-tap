class JsonSyslog < Formula
  desc "Validator for JSON syslog messages"
  homepage "https://github.com/tgragnato/json-syslog/"
  url "https://github.com/tgragnato/json-syslog.git", branch: "main"
  version "20260808"
  license "AGPL-3.0-only"

  livecheck do
    url "https://api.github.com/repos/tgragnato/json-syslog/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"json-syslog", "."
  end

  test do
    system "go", "test", "./..."
  end
end

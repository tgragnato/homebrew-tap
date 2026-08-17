class WhisperToGraphite < Formula
  desc "Read and send metrics from whisper files to Graphite"
  homepage "https://github.com/tgragnato/whisper-to-graphite/"
  url "https://github.com/tgragnato/whisper-to-graphite.git", branch: "main"
  version "20260817"
  license "MIT"

  livecheck do
    url "https://api.github.com/repos/tgragnato/whisper-to-graphite/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"whisper-to-graphite", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"whisper-to-graphite", "-h"
  end
end

class WhisperToGraphite < Formula
  desc "Read and send metrics from whisper files to Graphite"
  homepage "https://github.com/tgragnato/whisper-to-graphite/"
  url "https://github.com/tgragnato/whisper-to-graphite.git", branch: "main"
  version "20250525"
  license "MIT"

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

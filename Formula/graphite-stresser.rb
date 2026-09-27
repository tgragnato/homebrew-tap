class GraphiteStresser < Formula
  desc "Stress testing tool for Graphite"
  homepage "https://github.com/tgragnato/graphite-stresser"
  url "https://github.com/tgragnato/graphite-stresser.git", branch: "main"
  version "20260927"
  license :cannot_represent

  livecheck do
    url "https://api.github.com/repos/tgragnato/graphite-stresser/commits/main"
    strategy :json do |json|
      json["commit"]["committer"]["date"][0, 10].delete("-")
    end
  end

  depends_on "gradle" => :build
  depends_on "openjdk"

  def install
    system "gradle", "uberjar", "--no-daemon"
    libexec.install "build/libs/graphite-stresser.jar"
    bin.write_jar_script libexec/"graphite-stresser.jar", "graphite-stresser"
  end

  test do
    output = shell_output("#{bin}/graphite-stresser 2>&1")
    assert_match "Usage:", output
  end
end

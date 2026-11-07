require "language/node"

class DxCli < Formula
  desc "AI-native command-line tool for interacting with DX"
  homepage "https://docs.getdx.com/cli/"
  url "https://registry.npmjs.org/@get-dx/cli/-/cli-0.11.0.tgz"
  sha256 "45af782fb8bb89bf979fb8754d1a67b8c5f8a8cf5c9d6b31f4837138370261d1"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/@get-dx/cli"
    strategy :json do |json|
      json["dist-tags"]&.[]("latest")
    end
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/dx", "--help"
  end
end

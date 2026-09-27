require "language/node"

class DxCli < Formula
  desc "AI-native command-line tool for interacting with DX"
  homepage "https://docs.getdx.com/cli/"
  url "https://registry.npmjs.org/@get-dx/cli/-/cli-0.6.2.tgz"
  sha256 "c43516cb76f34bf65898a4c561b6ab9943e9e1d7a83e05fa4b1662625493b9af"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/@get-dx/cli"
    strategy :json do |json|
      json["dist-tags"]&.[]("latest")
    end
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/dx", "--help"
  end
end
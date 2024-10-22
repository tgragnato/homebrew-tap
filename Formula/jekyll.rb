class Jekyll < Formula
  desc "Simple, blog aware, static site generator"
  homepage "https://jekyllrb.com"
  url "https://github.com/jekyll/jekyll.git",
    tag:      "v4.3.4",
    revision: "a09a8dea057a9d69c76cbb8cc602d167c7144c45"
  license "MIT"

  depends_on "ruby"

  def install
    system "gem", "build", "jekyll.gemspec"
    system "gem", "install", "jekyll-#{version}.gem", "--install-dir=#{prefix}"
    Dir["#{bin}/*.lock"].each { |f| File.delete(f) }
  end

  test do
    system bin/"jekyll", "--version"
  end
end

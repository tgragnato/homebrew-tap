class Jekyll < Formula
  desc "Simple, blog aware, static site generator"
  homepage "https://jekyllrb.com"
  url "https://github.com/jekyll/jekyll.git",
    tag:      "v3.10.0",
    revision: "715f33b874445a8e5d0adf36e0ffa67f7d7627d3"
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

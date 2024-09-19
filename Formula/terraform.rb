class Terraform < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://www.terraform.io/"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.9.6",
    revision: "f164d45c3f5775f930c8ccb7d8c5295d8a5fcd52"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform", "."
  end

  test do
    system bin/"terraform", "--help"
  end
end

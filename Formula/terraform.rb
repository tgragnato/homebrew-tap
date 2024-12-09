class Terraform < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://www.terraform.io/"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.10.1",
    revision: "7bffc912cea2a563f90bfffce68e8cf44d3d8a5c"
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

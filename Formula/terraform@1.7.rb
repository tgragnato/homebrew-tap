class TerraformAT17 < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://www.terraform.io/"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.7.5",
    revision: "06a0a8c0666004bfcc7a13952de0b6f2ba27fc56"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform17", "."
  end

  test do
    system bin/"terraform17", "--help"
  end
end

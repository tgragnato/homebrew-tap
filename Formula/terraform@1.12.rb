class TerraformAT112 < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://www.terraform.io/"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.12.2",
    revision: "ce0baf874af938310a4cb03ad2d71150d474fa70"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform112", "."
  end

  test do
    system bin/"terraform112", "--help"
  end
end

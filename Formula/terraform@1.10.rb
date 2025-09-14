class TerraformAT110 < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://github.com/hashicorp/terraform"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.10.5",
    revision: "898e397ebaefb4d0c363b7332b3ba184b8852162"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform110", "."
  end

  test do
    system bin/"terraform110", "--help"
  end
end

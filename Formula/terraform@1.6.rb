class TerraformAT16 < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://github.com/hashicorp/terraform"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.6.6",
    revision: "eba3240dae80b8bdd14d747cc43d056ea22573f4"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform16", "."
  end

  test do
    system bin/"terraform16", "--help"
  end
end

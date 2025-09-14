class TerraformAT19 < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://github.com/hashicorp/terraform"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.9.8",
    revision: "e044e569c5bc81f82e9a4d7891f37c6fbb0a8a10"
  license "BUSL-1.1"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.version=#{version}", "-o", bin/"terraform19", "."
  end

  test do
    system bin/"terraform19", "--help"
  end
end

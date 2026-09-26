class Terraform < Formula
  desc "Automate infrastructure on any cloud with Terraform"
  homepage "https://github.com/hashicorp/terraform"
  url "https://github.com/hashicorp/terraform.git",
    tag:      "v1.16.4",
    revision: "6ee8af215a535cfca08bf729ff1017d4221d6667"
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

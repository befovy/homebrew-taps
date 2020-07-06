# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fvm < Formula
  desc "Flutter Version Manager"
  homepage "https://github.com/befovy/fvm"
  url "https://github.com/befovy/fvm/archive/v0.8.0.tar.gz"
  version "v0.8.0"
  sha256 "c0e08811ffd026e9ff123400dc7d99a3817acb75b1accac98d99eb8b6aaa1cb7"
  head "https://github.com/befovy/fvm.git"
  
  depends_on "go" => :build
  
  def install
    ENV["GOPROXY"] = "https://goproxy.io"
    system "go", "build"
    bin.install "fvm"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test fvm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/fvm", "--version"
  end

  bottle do
    root_url "https://github.com/befovy/homebrew-taps/releases/download/fvm-v0.8.0"
    cellar :any_skip_relocation
    sha256 "9aa47fd27c4892b03d622e8d7e0694ce19f0c1fee1f42871a21cd03bd907abf1" => :catalina
  end
end

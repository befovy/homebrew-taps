# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fvm < Formula
  desc "Flutter Version Manager"
  homepage "https://github.com/befovy/fvm"
  url "https://github.com/befovy/fvm/archive/v0.6.0.tar.gz"
  version "v0.6.0"
  sha256 "2d1f84229d2a698a1c15b754fbab08964777e9f818a74c419af0a758c338073d"
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
    root_url "https://github.com/befovy/fvm/releases/download/v0.6.0"
    cellar :any_skip_relocation
    sha256 "8c550917a60165bd8637af6e66702dd2878a1f22bb576fa4feb8d2c6af22fdbb" => :catalina
  end
end

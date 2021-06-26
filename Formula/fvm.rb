# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fvm < Formula
  desc "Flutter Version Manager"
  homepage "https://github.com/befovy/fvm"
  url "https://github.com/befovy/fvm/archive/v0.8.1.tar.gz"
  version "v0.8.1"
  sha256 "65961cda03e442c08969385984ee5876f02e5c8cb51134a4521da2ddd5902437"
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
    root_url "https://github.com/befovy/homebrew-taps/releases/download/fvm-v0.8.1"
    sha256 cellar: :any_skip_relocation, catalina: "762de672154069db6fb23593980d57f25842a718cf6baf48107fc8fb87e11005"
  end
end

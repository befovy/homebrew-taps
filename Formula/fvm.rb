# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fvm < Formula
    desc "Flutter Version Manager"
    homepage "https://github.com/befovy/fvm"
    url "https://github.com/befovy/fvm/archive/v0.4.0.tar.gz"
    version "v0.4.0"
    sha256 "abf18c801b7c59d5d765b2485f0e01cf653ec9ad8d789f17efe9f8f469472b51"
    head "https://github.com/befovy/fvm.git"
  
    depends_on "go" => :build
  
    def install
      ENV["GOPROXY"] = "https://goproxy.io"
      system "go", "build"
      bin.install "fvm"
    end
  
    bottle do
      root_url "https://github.com/befovy/fvm/releases/download/v0.4.0"
      sha256 "f2e674e13ac6c1160cc8ef46d6fae85da80b48b165ca949c58d79a34e0b31885" => :catalina
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
  end
  
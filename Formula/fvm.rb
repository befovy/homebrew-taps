# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fvm < Formula
    desc "Flutter Version Manager"
    homepage "https://github.com/befovy/fvm"
    url "https://github.com/befovy/fvm/archive/v0.5.0.tar.gz"
    version "v0.5.0"
    sha256 "30c2730ad306f457a75f1093381b2f800d7691d93fab4cb190ffce4f66e168ff"
    head "https://github.com/befovy/fvm.git"
  
    depends_on "go" => :build
  
    def install
      ENV["GOPROXY"] = "https://goproxy.io"
      system "go", "build"
      bin.install "fvm"
    end
  
    bottle do
      root_url "https://github.com/befovy/fvm/releases/download/v0.5.0"
      sha256 "e4cef34252d7a373586d167aafa0998eee35eba9bf0987b388adef443b24c67f" => :catalina
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
  
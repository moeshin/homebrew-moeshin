class AndroidBuildTools < Formula
  desc "Android SDK Build-Tools is a component of the Android SDK required for building Android apps"
  homepage "https://developer.android.com/studio/releases/build-tools"
  if OS.linux?
    url "https://dl.google.com/android/repository/build-tools_r31-rc1-linux.zip"
    sha256 "0771cd2712d4f99e8eb4a2f9c8acabc1a76554a12c7d0cce48a7279f416c02ae"
  elsif
    url "https://dl.google.com/android/repository/9dee0a2bc9f5fd4d8d328f3fa475fed8aba6faea.build-tools_r31-rc1-macosx.zip"
    sha256 "cea7c7844a95935bd2dc7eb36dedee105424f1d0d89100fe4cf43349fe266510"
  end
  version "31.0.0-rc1"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"aapt"
    bin.install_symlink libexec/"aapt2"
    bin.install_symlink libexec/"aidl"
    bin.install_symlink libexec/"apksigner"
    bin.install_symlink libexec/"bcc_compat"
    bin.install_symlink libexec/"d8"
    bin.install_symlink libexec/"dexdump"
    bin.install_symlink libexec/"dx"
    bin.install_symlink libexec/"lld"
    bin.install_symlink libexec/"llvm-rs-cc"
    bin.install_symlink libexec/"mainDexClasses"
    bin.install_symlink libexec/"split-select"
    bin.install_symlink libexec/"zipalign"
  end
end

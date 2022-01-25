class AndroidBuildTools < Formula
  desc "Android SDK Build-Tools is a component of the Android SDK required for building Android apps"
  homepage "https://developer.android.com/studio/releases/build-tools"
  if OS.linux?
    url "https://dl.google.com/android/repository/build-tools_r32-rc1-linux.zip"
    sha256 "B2ED1180647E200E01FE46095B9713B0A26226D225C3F5E08BA6B9DA33620B0A"
  elsif
    url "https://dl.google.com/android/repository/82ec85db1b6d346fbe2730553de2bb5a83e85941.build-tools_r32-rc1-macosx.zip"
    sha256 "D110C345EB9FC85FA238DA6B93AE02A52147A34E0771735DDBA00204DB1E2BFC"
  end
  version "32.0.0-rc1"
  license "Apache-2.0"

  livecheck do
    url "https://dl.google.com/android/repository/repository2-1.xml"
    regex(/<remotePackage path="build-tools;(.*?)">/)
  end

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
    bin.install_symlink libexec/"lld-bin/lld"
    bin.install_symlink libexec/"llvm-rs-cc"
    bin.install_symlink libexec/"mainDexClasses"
    bin.install_symlink libexec/"split-select"
    bin.install_symlink libexec/"zipalign"
  end
end

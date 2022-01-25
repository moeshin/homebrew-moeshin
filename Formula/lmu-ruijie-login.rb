class LmuRuijieLogin < Formula
  desc "黎明职业大学-锐捷校园网网线自动登录"
  homepage "https://github.com/moeshin/lmu-ruijie-login"
  version "1.0.0"
  license "MIT"

  os = OS::linux? ? "linux" : "darwin"
  if Hardware::CPU.is_64_bit?
    if Hardware::CPU.arm?
      arch = "arm64"
      sha256 ""
    else
      arch = "amd64"
      sha256 ""
    end
  else
    if Hardware::CPU.arm?
      arch = "arm"
      sha256 ""
    else
      arch = "386"
      sha256 ""
    end
  end
  
  url "https://github.com/moeshin/lmu-ruijie-login/releases/download/v#{version}/lmu-ruijie-login-#{os}-#{arch}.tar.gz",
      revision: "a7255afbefaaac77a4e742c3aead01d4c22829a4"
  
  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"lmu-ruijie-login"
  end
end

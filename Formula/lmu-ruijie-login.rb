class LmuRuijieLogin < Formula
  desc "黎明职业大学-锐捷校园网网线自动登录"
  homepage "https://github.com/moeshin/lmu-ruijie-login"
  url "https://github.com/moeshin/lmu-ruijie-login/archive/v1.0.2.tar.gz"
  sha256 "361008d4019528b726a6001c22da6aa4cc86650cc19196c8fa6a89456b0d23b1"
  license "MIT"
  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "./make.sh"
    prefix.install Dir["build/local/*"]
    bin.install_symlink prefix/"lmu-ruijie-login"

    cfg = File.absolute_path(etc/"lmu-ruijie-login.ini")
    File.file?(cfg) || mv(prefix/"config.ini", cfg)
    ln_sf cfg, prefix/"config.ini"

    log = File.absolute_path(var/"lmu-ruijie-login.log")
    File.file?(log) || touch(log)
    ln_sf log, prefix/"log.txt"

    print <<~EOS

      配置文件："#{opt_prefix}/config.ini"

      可作为服务开机运行
      安装服务："#{opt_prefix}/service-install.sh"
      卸载服务："#{opt_prefix}/service-install.sh"
      服务日志："#{opt_prefix}/log.txt"

    EOS
  end
end

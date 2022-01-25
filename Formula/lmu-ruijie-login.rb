class LmuRuijieLogin < Formula
  desc "黎明职业大学-锐捷校园网网线自动登录"
  homepage "https://github.com/moeshin/lmu-ruijie-login"
  url "https://github.com/moeshin/lmu-ruijie-login/archive/v1.0.1.tar.gz"
  sha256 "e5454c2db7331e039866e6738a494d4e1415c7fe9de1a5bc399470b5a36efab7"
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

class LmuRuijieLogin < Formula
  desc "黎明职业大学-锐捷校园网网线自动登录"
  homepage "https://github.com/moeshin/lmu-ruijie-login"
  url "https://github.com/moeshin/lmu-ruijie-login/archive/v1.0.0.tar.gz"
  sha256 "f5ca1844ffca1fe854151cec97a384846c0e47573fc4a54ef1d7fcbe8fbbe604"
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
    File.file?(log) || touc(log)
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

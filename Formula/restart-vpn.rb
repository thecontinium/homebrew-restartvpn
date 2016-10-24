class RestartVpn< Formula
  homepage 'https://github.com/thecontinium/homebrew-restartvpn/'
  url 'https://github.com/thecontinium/homebrew-restartvpn.git'
  version '0.0.3'

  skip_clean 'bin'


  def install
    bin.install 'restartvpn'
  end

  #plist_options :startup => true

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>AbandonProcessGroup</key>
      <true/>
    	<key>Label</key>
      <string>#{plist_name}</string>
    	<key>ProgramArguments</key>
	    <array>
		    <string>/usr/local/bin/restartvpn</string>
	    </array>
	    <key>StandardErrorPath</key>
      <string>/tmp/#{plist_name}.err</string>
      <key>StandardOutPath</key>
      <string>/tmp/#{plist_name}.out</string>
      <key>RunAtLoad</key>
      <true/>
      <key>ExitTimeOut</key>
      <integer>300</integer>
      <key>LaunchOnlyOnce</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end

# Keydnap_Checker
Keydnap malware checker

![](http://www.welivesecurity.com/wp-content/themes/eset/images/logo-la-es.jpg)

Link to <a href="http://www.welivesecurity.com/2016/08/30/osxkeydnap-spreads-via-signed-transmission-application">welivesecurity new</a>

### USAGE

~~~bash
$ git clone https://github.com/joanbono/Keydnap_Checker.git
$ cd Keydnap_Checker/src/
$ chmod +x Keydnap_Checker.sh
$ ./Keydnap_Checker.sh
~~~

OR

~~~bash
$ git clone https://github.com/joanbono/Keydnap_Checker.git
$ cd Keydnap_Checker/src/
$ bash Keydnap_Checker.sh
~~~

The Keydnap_Checker looks for known files created by the malware:
~~~
/Applications/Transmission.app/Contents/Resources/License.rtf
/Volumes/Transmission/Transmission.app/Contents/Resources/License.rtf
$HOME/Library/Application Support/com.apple.iCloud.sync.daemon/icloudsyncd
$HOME/Library/Application Support/com.apple.iCloud.sync.daemon/process.id
$HOME/Library/LaunchAgents/com.apple.iCloud.sync.daemon.plist
/Library/Application Support/com.apple.iCloud.sync.daemon/
$HOME/Library/LaunchAgents/com.geticloud.icloud.photo.plist
~~~
And asks the user for its deletion.

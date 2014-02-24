rm -rf debug.apk
rm -rf release.apk
rm -rf matchthree_debug.apk
rm -rf matchthree_release.apk

cp match-three.apk debug.apk
cp match-three.apk release.apk

REM - use this for debug

jarsigner -verbose -keystore TheMobileGamer.dat -storepass TheMobileGamer debug.apk TheMobileGamer
jarsigner -verify -verbose debug.apk
zipalign -f -v 4 debug.apk matchthree_debug.apk
zipalign -c -v 4 matchthree_debug.apk

PAUSE

REM - use this for release

jarsigner -verbose -keystore TheMobileGamer -storepass TheMobileGamer release.apk TheMobileGamer
jarsigner -verify -verbose release.apk
zipalign -f -v 4 release.apk matchthree_release.apk
zipalign -c -v 4 matchthree_release.apk

PAUSE

keytool -v -list -alias TheMobileGamer -keystore TheMobileGamer -storepass TheMobileGamer

PAUSE
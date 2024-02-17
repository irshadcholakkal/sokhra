# armino_ecom

Flutter 3.0.5 => 3.3.0

## Localization
1. add localized files in each modules assets/lang folder -> eg: presentation/core/assets/lang/en.json
2. add module folder name in "_languageAssets" list of base_module/domain/entity/translation.dart;
4. add assets under flutter-assets in pubspec.yml -> - lib/<module name>/presentation/core/assets/lang/

## JSON Serialization
1. flutter pub run build_runner build --delete-conflicting-outputs
2. flutter pub run build_runner watch

## Launcher icons
flutter pub run flutter_launcher_icons:main

## Key Generation
D:\Android\Studio\jre\bin\keytool -genkey -v -keystore key_homey.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key_homey
D:\Android\Studio\jre\bin\keytool -importkeystore -srckeystore key_homey.jks -destkeystore key_homey.jks -deststoretype pkcs12

## SHA 256
gradlew signingReport

try {} catch (e) {
  debugPrint("::Exception:" + e.toString());
}

## Firebase
1. makesolutions.studio.homey
2. android/build.gradle -> classpath 'com.google.gms:google-services:4.3.8' //firebase
3. android/app/build.gradle ->
    a. apply plugin: 'com.google.gms.google-services' //firebase
    b. multiDexEnabled true //firebase
    c. implementation 'com.android.support:multidex:1.0.3' //firebase

## Firebase dynamic link
1. android
    a. AndroidManifest.xml
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />

            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />

            <data
                android:host="orderhomey.page.link"
                android:scheme="https" />
        </intent-filter>
2. ios
    a. info.plist
        <key>CFBundleURLTypes</key>
        <array>
            <dict>
                <key>CFBundleTypeRole</key>
                <string>Editor</string>
                <key>CFBundleURLName</key>
                <string>Bundle ID</string>
                <key>CFBundleURLSchemes</key>
                <array>
                    <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
                </array>
            </dict>
        </array>
    b. Runner.entitlements
        <key>com.apple.developer.associated-domains</key>
        <array>
            <string>applinks:sema.page.link</string>
        </array>

## Tags used
1. //INFO:
2. //TODO:
3. //TOTAL:

wix site: https://360vishnu.wixsite.com/lumiereorganics

D:\Android\flutter3.3.0\bin\flutter.bat
D:\Android\flutter3.3.0\bin\flutter.bat clean
D:\Android\flutter3.3.0\bin\flutter.bat build apk
D:\Android\flutter3.3.0\bin\flutter.bat pub add
D:\Android\flutter3.3.0\bin\flutter.bat pub run build_runner build --delete-conflicting-outputs
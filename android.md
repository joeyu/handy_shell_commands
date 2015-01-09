# Android command tips

## Input

### Key events:

```
$ input keyevent <keycode>
```

* Key codes

  Code | String | Description
  -----|--------|------------
  0 |  "KEYCODE_UNKNOWN"  |
  1 |  "KEYCODE_MENU"  |
  2 |  "KEYCODE_SOFT_RIGHT"  |
  3 |  "KEYCODE_HOME"  |
  4 |  "KEYCODE_BACK"  |
  5 |  "KEYCODE_CALL"  |
  6 |  "KEYCODE_ENDCALL"  |
  7 |  "KEYCODE_0"  |
  8 |  "KEYCODE_1"  |
  9 |  "KEYCODE_2"  |
  10 |  "KEYCODE_3"  |
  11 |  "KEYCODE_4"  |
  12 |  "KEYCODE_5"  |
  13 |  "KEYCODE_6"  |
  14 |  "KEYCODE_7"  |
  15 |  "KEYCODE_8"  |
  16 |  "KEYCODE_9"  |
  17 |  "KEYCODE_STAR"        |
  18 |  "KEYCODE_POUND"            |
  19 |  "KEYCODE_DPAD_UP" | Moving up the focus
  20 |  "KEYCODE_DPAD_DOWN" | Moving down the focus 
  21 |  "KEYCODE_DPAD_LEFT" | Moving left the focus
  22 |  "KEYCODE_DPAD_RIGHT" | Moving right the focus
  23 |  "KEYCODE_DPAD_CENTER" | hitting the focus
  24 |  "KEYCODE_VOLUME_UP" |
  25 |  "KEYCODE_VOLUME_DOWN" |
  26 |  "KEYCODE_POWER" |
  27 |  "KEYCODE_CAMERA" |
  28 |  "KEYCODE_CLEAR" |
  29 |  "KEYCODE_A" |
  30 |  "KEYCODE_B" |
  31 |  "KEYCODE_C" |
  32 |  "KEYCODE_D" |
  33 |  "KEYCODE_E" |
  34 |  "KEYCODE_F" |
  35 |  "KEYCODE_G" |
  36 |  "KEYCODE_H" |
  37 |  "KEYCODE_I" |
  38 |  "KEYCODE_J" |
  39 |  "KEYCODE_K" |
  40 |  "KEYCODE_L" |
  41 |  "KEYCODE_M" |
  42 |  "KEYCODE_N" |
  43 |  "KEYCODE_O" |
  44 |  "KEYCODE_P" |
  45 |  "KEYCODE_Q" |
  46 |  "KEYCODE_R" |
  47 |  "KEYCODE_S" |
  48 |  "KEYCODE_T" |
  49 |  "KEYCODE_U" |
  50 |  "KEYCODE_V" |
  51 |  "KEYCODE_W" |
  52 |  "KEYCODE_X" |
  53 |  "KEYCODE_Y" |
  54 |  "KEYCODE_Z" |
  55 |  "KEYCODE_COMMA" |
  56 |  "KEYCODE_PERIOD" |
  57 |  "KEYCODE_ALT_LEFT" |
  58 |  "KEYCODE_ALT_RIGHT" |
  59 |  "KEYCODE_SHIFT_LEFT" |
  60 |  "KEYCODE_SHIFT_RIGHT" |
  61 |  "KEYCODE_TAB" |
  62 |  "KEYCODE_SPACE" |
  63 |  "KEYCODE_SYM" |
  64 |  "KEYCODE_EXPLORER" |
  65 |  "KEYCODE_ENVELOPE" |
  66 |  "KEYCODE_ENTER" |
  67 |  "KEYCODE_DEL" |
  68 |  "KEYCODE_GRAVE" |
  69 |  "KEYCODE_MINUS" |
  70 |  "KEYCODE_EQUALS" |
  71 |  "KEYCODE_LEFT_BRACKET" |
  72 |  "KEYCODE_RIGHT_BRACKET" |
  73 |  "KEYCODE_BACKSLASH" |
  74 |  "KEYCODE_SEMICOLON" |
  75 |  "KEYCODE_APOSTROPHE" |
  76 |  "KEYCODE_SLASH" |
  77 |  "KEYCODE_AT" |
  78 |  "KEYCODE_NUM" |
  79 |  "KEYCODE_HEADSETHOOK" |
  80 |  "KEYCODE_FOCUS" |
  81 |  "KEYCODE_PLUS" |
  82 |  "KEYCODE_MENU" |
  83 |  "KEYCODE_NOTIFICATION" |
  84 |  "KEYCODE_SEARCH" |
  85 |  "TAG_LAST_KEYCODE"|

### Touch screen

#### Swiping from the bottom of the touch screen.

```
$ adb shell input swipe  500 1900 500 1000 
```

## The `sqlite3` database

### Opening the database of `com.android.providers.settings`

```
$ adb root
$ adb shell 
# sqlite3 /data/data/com.android.providers.settings/databases/settings.db
sqlite> .exit
#
```

### Querying the tables of the database
```
sqlite> .tables
android_metadata   bookmarks          secure
bluetooth_devices  global             system
```

### Querying the 'system' table  

```
sqlite> select * from system;
```

### Setting screen to sleep after 1 hour

```
sqlite> update system set value='360000' where name='screen_off_timeout';

```

After updating the database, the system needs to restart to take effect.

## Application 
### Starting an application's activity

```
# am start -a <ACTION> -n <PACKAGE>/.<ACTIVITY>
```

`INTENT`, `PACKAGE` and `ACTIVITY` can be found in the `AndroidManifest.xml` file of the apk file. 

Decode the `AndroidManifest.xml` file by using [apktool](#apktool).

In the decoded text, search the decoded text for `<package=`, of which the value is `PACKAGE`. 

And then search for `<application`, and the first `<activity` tag under it, and its `android:name=` attribute, of which the value is a domain name, and its last component is `ACTIVITY`. 

And then search for the `<intent-filter>` under the `<activity`, and `<action` and its `android:name=` attribute, of which the value is the `ACTION`.

For exmple, the following command starts chrome shell browser with http://www.yahoo.com:

```
$ am start -a android.intent.action.MAIN -n -n org.chromium.chrome.shell/.ChromeShellActivity -d http://www.yahoo.com
```

## Network

### Enabling the WiFi
```
$ svc wifi enable
``` 

### Showing the ethernet IP address

The following command show the IP address of the ethernet `eth0`:

```
$ ip addr show eth0
```

Or,

```
$ ifconfig eth0
```

Or,

```
$ netcfg
```

### Configuring the ethernet 


The following commands configures the `eth0` ethernet device with DHCP:

```
# netcfg eth0 up
# netcfg eth0 dhcp
```

And you will probably have to set DNS servers, as some DHCP servers do not return DNS servers properly.

```
# setprop net.dns1 8.8.8.8
# setprop net.dns2 8.8.4.4
```
Or, to configure with static IP address:

```
# netcfg eth0 up
# ifconfig eth0 <IP> netmask <NETMASK>
# route add default gw <GATEWAY> dev eth0
# setprop net.dns1 8.8.8.8
# setprop net.dns2 8.8.4.4
```

### Configuring the WiFi

The `wpa_supplicant` uses the configuration file in

>/data/misc/wifi/wpa_supplicant.conf



 

## .apk file

<a name="apktool">
### Manipulating .apk files
  
[apktool] is a very powerful tool written in Java for packing and unpacking the .apk files.

For example, unpacking file foo.apk:

```
$ java -jar apktool.jar d foo.apk
```

It is recommanded to create a shell script `apktool` along with the apktool.jar file in $PATH to ease typing:

```
#!/bin/sh
DIR=$(dirname $0)
java -jar $DIR/apktool.jar $*
```
  




[apktool]:          https://code.google.com/p/android-apktool/

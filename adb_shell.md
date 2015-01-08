# `adb shell` command tips

## `input keyevent`

* POWER key

   > adb shell input keyevent KEYCODE_POWER

## `sqlite3`

* Opening the database of `com.android.providers.settings`

```
$ adb root
$ adb shell 
$ sqlite3 /data/data/com.android.providers.settings/databases/settings.db
```

* Querying the database' tables
```
sqlite> .tables
android_metadata   bookmarks          secure
bluetooth_devices  global             system
```

* Querying the 'system' table  
```
sqlite> select * from system;
```

* Setting screen to sleep after 1 hour
```
sqlite> update system set value='360000' where name='screen_off_timeout';

```

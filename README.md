# Handy commands

## `adb shell`

### 'input keyevent`

* POWER key

   > adb shell input keyevent KEYCODE_POWER

### `


* querying the tables of the 'settings' database

   > adb shell sqlite3 /data/data/com.android.providers.settings/databases/settings.db ".tables"

* querying the 'system settings' table  
   > adb shell sqlite3 /data/data/com.android.providers.settings/databases/settings.db "select * from system;"

* screen sleeps after 1 hour

   > adb shell sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='360000' where name='screen_off_timeout';"

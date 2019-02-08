
to install the config go to read config/History/histConfig file

1.Copy files in config folder keeping the same path

2.Create link with the expected path in link folder
```sh
ln -s ~/config_thomas/config/ .
```
The path is breakable, think to keep a strong localisation

3.Set the backup option to numbered( to keep old version ) 
```sh
export SIMPLE_BACKUP_SUFFIX=t
```

4.From link copy all links to home
```sh
cp -abi ./{\.[a-z],*}* ~
```

5.to restor ... look for *.~#~

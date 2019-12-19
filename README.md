# Simple vim extension to get and write dontpad data with vim :)

## Instalation

## Dependencies 

```sh
pip3 install requests
pip3 install bs4
```

1. vim with +python3 
2. requests module in python: use `pip3 install requests`
3. BeautifulSoup module in python: use `pip3 install bs4`



### In OSX

```sh

cd ~/.vim/pack/plugins/start/
git clone git@github.com:AlvaroMarques/vimpad.git 

``` 

### TODO: In Linux

## Instructions

1. Use `:call OpenPage("location")` to open the `dontpad.com/location` 
2. Use `:w` to write and save in the dontpad
3. Use `:e` to refresh the page
4. When quitting the vim session, the temporary file will be automatically removed from your system

from requests import post, get
import re
import vim
from functools import wraps
from bs4 import BeautifulSoup

class DontpadControl():
    def __init__(self, url=""):
        if url == "": 
            self.url = ""
            print("please choose a location")
            return
        self.location = url
        self.url = f"http://dontpad.com/{url}" 
        self.filename = f".{url}.tmp"
        self.url_menu = f"http://dontpad.com/{url}.menu.json" 
    def check_wrapper(function):
        @wraps(function)
        def wrapper(self, *args, **kwargs):
            if self.check_url():
                return function(self, *args, **kwargs)
            return
        return wrapper
    def check_url(self):
        if self.url == "":
            print("please choose a location")
            return False
        return True

    @check_wrapper
    def getText(self):
        with get(self.url) as x:
            soup = BeautifulSoup(x.text,'html.parser')
            text = soup.find('textarea', {'id':'text'})
            return str(re.sub(r'</?textarea[\w\W\d]+?>',r'', str(text))).replace("</textarea>","")
    @check_wrapper
    def openPage(self):
        page_str = self.getText()
        with open(self.filename, "w") as f:
                f.write(page_str)
        vim.command(f"vsplit {self.filename}")
    @check_wrapper
    def savePage(self):
        vim.command(':w')
        with open(self.filename, "r") as f:
            txt = f.read()
        payload = {'text': txt} 
        post(self.url, params=payload)
      
 
        

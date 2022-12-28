Elliot, is trying to download files from a criminal organization's network. He found out that when he tries to download files continuously one after the other, the network blocks him. Help Elliot, modify his program to add a **3-second delay** after downloading every file.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
def download_file(file):
  print(f"Downloading file {file}")

files = ["secret.tar", "planned_targets.csv", "topsecret.zip", "hacked_accounts.txt", "cia.pdf"]
for file in files:
  download_file(file)
</code>

<solution>
import time

def download_file(file):
  print(f"Downloading file {file}")
  
  
files = ["secret.tar", "planned_targets.csv", "topsecret.zip", "hacked_accounts.txt", "cia.pdf"]
for file in files:
  download_file(file)
  time.sleep(3)
</solution>
</codeblock>
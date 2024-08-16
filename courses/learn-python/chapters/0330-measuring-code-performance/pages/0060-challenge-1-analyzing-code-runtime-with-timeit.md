Elliot has noticed the download time is not the same in every attempt. He is trying to gauge an average download time so he can optimize his code accordingly. Help him get the average download time for 5 runs, using `timeit`. Print the average download time in the following format:

**It takes X seconds on average to download all the files.**


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
import time
import random

def download_file(file):
  delay = random.randrange(0, 2)
  print(f"Downloading file {file}")    
  time.sleep(delay)
  
def run():
  files = ["secret.tar", "planned_targets.csv", "topsecret.zip", "hacked_accounts.txt", "cia.pdf"]
  for file in files:
    download_file(file)
    time.sleep(1)
    
run()
</code>

<solution>
import time
import random
from timeit import timeit

def download_file(file):
  delay = random.randrange(0, 2)
  print(f"Downloading file {file}")    
  time.sleep(delay)
  
def run():
  files = ["secret.tar", "planned_targets.csv", "topsecret.zip", "hacked_accounts.txt", "cia.pdf"]
  for file in files:
    download_file(file)
    time.sleep(1)
    
execution_time = timeit(run, number=5) / 5
print(f"It takes {execution_time} seconds on average to download all the files.")
</solution>
</codeblock>
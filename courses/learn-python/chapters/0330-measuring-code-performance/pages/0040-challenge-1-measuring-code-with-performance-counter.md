While downloading the files from the criminal server, Elliot realized that the server cuts him off if he is connected for longer than 15 seconds continuously. Help Elliot, optimize his code and reduce the time it takes to download all the files.

Use `perf_counter()` to measure the time it takes to execute the entire code. Reduce the sleep delay time to 2 seconds, if the code exceeds the 15-second threshold.

Print the execution time at the end in the following format:

**The code took X seconds to run.**


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
import time

def download_file(file):
  print(f"Downloading file {file}")
  
  
files = ["secret.tar", "planned_targets.csv", "topsecret.zip", "hacked_accounts.txt", "cia.pdf"]
for file in files:
  download_file(file)
  time.sleep(3)
</code>

<solution>
import time

def download_file(file):
  print(f"Downloading file {file}")
  
start_time = time.perf_counter()
files = ["secret.tar", "planned_targets.csv", "topsecret.zip", "hacked_accounts.txt", "cia.pdf"]
for file in files:
  download_file(file)
  time.sleep(2)
  
stop_time = time.perf_counter()
execution_time = (stop_time - start_time)
print(f"The code took {execution_time} seconds to run.")
</solution>
</codeblock>
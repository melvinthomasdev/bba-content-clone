Installing and using Ruby in Rails natively in Windows is a very difficult and painful process. So we will be taking the help of WSL(Windows Subsystem for Linux) for this process. WSL allows developers to run a Linux environment without the need for a separate virtual machine or dual booting. So before we get on with the installation of Ruby on Rails lets install WSL.

IMPORTANT NOTE: For installing WSL you need to have a minimum Windows version of Windows 10 version 2004 and higher (Build 18362 and higher)

Note: You can skip this step if you have already installed WSL2 on your machine.

## Installing WSL

To start, enable WSL feature in windows if not already done. You can do this by opening a new PowerShell window as an administrator.

Tip: To open Powershell as an administrator, search and find `PowerShell` on the start menu, right click on the `Microsoft PowerShell` app and click on `Run as Administrator`.

<image alt="Run as admin">run-as-admin.png</image>

Now execute the following command:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

After this step, PowerShell might ask you to restart your machine. Let's restart out machine and continue with the installation by typing `Y`.

<image alt="Powershell install">powershell-install.png</image>

Once the system has been restarted, open a new PowerShell window and execute the command:

```powershell
wsl --install
```

Note that we will be using WSL2 which is the default version of WSL in Windows machines now. If you have an older version of Windows, you might be defaulted to WSL 1 instead. To avoid this, let's specifically set the default version of WSL to be WSL2.

```powershell
wsl --set-default-version 2
```

Once this step is done, you should reboot your system. Most of these features require a system reboot for activation since these are changes made in the system level.

If WSL has already been installed on your system, then you should see a similar message when you execute the above command:

<image alt="WSL already installed">wsl-already-installed.png</image>

Now you can choose your preferred distro to use along with WSL. To see a list of all available distros you can execute:

```powershell
wsl --list --online
```

This will give you a result similar to this:

```
NAME                                   FRIENDLY NAME
Ubuntu                                 Ubuntu
Debian                                 Debian GNU/Linux
kali-linux                             Kali Linux Rolling
Ubuntu-18.04                           Ubuntu 18.04 LTS
Ubuntu-20.04                           Ubuntu 20.04 LTS
Ubuntu-22.04                           Ubuntu 22.04 LTS
OracleLinux_7_9                        Oracle Linux 7.9
OracleLinux_8_7                        Oracle Linux 8.7
OracleLinux_9_1                        Oracle Linux 9.1
openSUSE-Leap-15.5                     openSUSE Leap 15.5
SUSE-Linux-Enterprise-Server-15-SP4    SUSE Linux Enterprise Server 15 SP4
SUSE-Linux-Enterprise-15-SP5           SUSE Linux Enterprise 15 SP5
openSUSE-Tumbleweed                    openSUSE Tumbleweed
```

You can choose any distro you like from the list. For the rest of the guide we will be using the commands for Ubuntu. If you like to follow along with the guide, we recommend you choose the Ubuntu distro as well.

To install Ubuntu execute the command:

```powershell
wsl --install -d Ubuntu
```

Some of you may face the following error:

<image alt="WSL kernel error">wsl-kernel-error.png</image>

In this case, you need to update the WSL kernal to the latest machine. For this find the architecture of your CPU. It can be found by executing the following:

```powershell
systeminfo | find "System Type"
```

For x64 machines: download and install
[this update](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).

For ARM64 machines: download and install
[this update](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_arm64.msi)

After installing these updates, try re-installing Ubuntu with the steps mentioned above.

After the installation, let's ensure that the distro was installed with WSL2 by executing this command:

```powershell
wsl --list --verbose
```

You should get an output similar to this:

```
NAME      STATE      VERSION
Ubuntu    Running    2
```

Instead, if you see that the version is one, we need to change it to version 2.

IMPORTANT NOTE: You can skip to the next step if the output you received in the line above is 2.

To change the WSL from 1 to 2 for Ubuntu, execute the following command:

```powershell
wsl --set-version Ubuntu 2
```

IMPORTANT NOTE: For older systems (Windows 10 build < 19041) these steps won't work. For these versions use the following commands to install WSL. If you were able to successfully installs WSL using the steps mentioned above, you can skip these steps and start with the next section.

_Step 1_: Open a new PowerShell window in Administrator mode (Start menu > PowerShell > right-click > Run as Administrator)

_Step 2_: Enable Windows-Subsystem-Linux

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Restart the machine if prompted.

_Step 3_: Enable the Virtual machine feature:

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

_Step 4_: Download the latest Linux kernal update package by visiting [this link](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).

_Step 5_: Download the image for Ubuntu by visiting [this link](https://aka.ms/wslubuntu). Note: This link downloads the LTS version of Ubuntu. Installing this package might throw an error for some Windows users. This can be due to any of the following reasons:

- Your system doesn't support the LTS version of Ubuntu. In these cases download the version 20.04 by visiting [this link](https://aka.ms/wslubuntu2004) instead.
- Your system has an ARM chip. In that case download the ARM version of Ubuntu by visiting [this link](https://aka.ms/wslubuntu2004arm).
- If none of these help its possible that WSL cannot be installed on your machine. Learn more by visiting [this link](https://learn.microsoft.com/en-us/windows/wsl/install-manual#downloading-distributions).

_Step 6_: Once download is complete, open PowerShell and navigate to the directory in which the package was downloaded

```powershell
cd C:\Users\<Username>\Downloads
```

_Step 7_: Now install the package:

```powershell
Add-AppxPackage <YourBundleName>.AppxBundle
```

_Step 8_: Now add the Linux distribution path to your Windows Environment PATH variables

```powershell
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\Users\<UserName>\Ubuntu", "User")
```

Replace UserName with your user name.

_Step 9_: Once done open the Ubuntu app from the start menu

<image alt="Ubuntu start menu">ubuntu-start-menu.png</image>

## Creating a new Username and Password for UNIX

When you open the Ubuntu terminal for the first time, you will be prompted to create a new UNIX username and password. Add your desired username and password. and continue.

IMPORTANT NOTE: Make sure to note down these credentials since you will have to reinstall WSL completely if you forget them.

<image alt="Unix username password">unix-username-password.png</image>

## Install Windows Terminal (Optional)

The development experience using the Command Prompt shell, PowerShell and the WSL native terminal is subpar. To overcome this limitation, let's install the Windows Terminal.

1. Go to the [Windows Terminal download page](https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=en-us&gl=US) and download the app.
2. Install Terminal via Microsoft store.

Note: If you were able to install Windows terminal using the steps mentioned above please skip to the next section.

If your system doesn't have Microsoft store or you were not able to install the terminal using the steps mentioned above, follow these steps:

_Step 1_: Visit the [Windows Terminal GitHub page](https://github.com/microsoft/terminal/releases).

_Step 2_: Find the latest release and click the msixbundle file to download it

<image alt="Msixbundle latest version">msixbundle-latest-version.png</image>

_Step 3_: Navigate to the folder where the file was downloaded.

```powershell
cd C:\Users\UserName\Downloads
```

_Step 4_: Install the package

```powershell
Add-AppxPackage .\<YourPackageName>.msixbundle
```

IMPORTANT NOTE: You need atleast Windows 10 2004 (build >= 10.0.19041.0) for installing Windows Terminal.

## Install VSCode on your machine (Optional but recommended)

When working with WSL in Windows, we recommend using VSCode as you default text editor. This is because of the officially available Microsoft extensions in VSCode that can help you work with WSL much easier. To install VSCode follow these steps:

_Step 1_: Go to the [VSCode page](https://code.visualstudio.com/) and download the latest version.

_Step 2_: Double click on the downloaded EXE file and install VSCode

_Step 3_: Now open VSCode and click to the extensions tab. There search for WSL and install the WSL extension.

<image alt="WSL extension vscode">wsl-extension-vscode.png</image>

_Step 4_: Now click on the search bar on top of your VSCode screen and type the greater than (`>`) symbol your keyboard to open the command palette.

_Step 5_: Now search and find the option `WSL: Connect to WSL` and click on it.

<image alt="Connect to wsl">connect-to-wsl.png</image>

_Step 6_: Your VSCode window will be refreshed and you will see a WSL tag on the bottom left corner of your VSCode screen indicating you are connected to WSL.

<image alt="WSL tag vscode">wsl-tag-vscode.png</image>

Now you will be able to access WSL directly from your VSCode.

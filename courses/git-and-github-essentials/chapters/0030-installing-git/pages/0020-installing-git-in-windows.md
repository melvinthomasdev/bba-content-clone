Installing Git on Windows can be done with or without WSL. Let's explore both ways.

## Installing Git with WSL (Recommended)

WSL is a compatibility layer for running Linux binary executables natively on Windows. We have a separate guide on how to install WSL on Windows. You can check it out [here](https://courses.bigbinaryacademy.com/install-rubyonrails-in-windows/setting-up-your-development-environment/#installing-wsl). You can install Git on your Windows using WSL by following these steps:

_Step 1_: Open your WSL terminal.

_Step 2_: Update the package list using the following command.

```bash
sudo apt update
```

_Step 3_: Install Git using the following command.

```bash
sudo apt install git
```

_Step 4_: Verify the installation by running the following command.

```bash
git --version
```

This command will display the version of Git installed on your system.

## Installing Git without WSL

To install Git on Windows without WSL, we can download the installer from the [official Git website](https://git-scm.com/download/win). The installer will download the latest version of Git for Windows and provide us with an installation wizard. Follow the on-screen instructions to install Git on your Windows system. You can check out [this](https://phoenixnap.com/kb/how-to-install-git-windows) link for navigating through the installation process.

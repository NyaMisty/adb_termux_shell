# ADB Termux Shell

An almost perfect solution to use Termux in `adb shell`

## Usage

1. Install termux, **enable the internal storage permission**

2. Download this repo, and Put `adb_termux_shell` folder to `/sdcard/adb_termux_shell`

3. Configure your shell to auto start termux: Append `mkshrc`'s content into the place where your adb shell will call
    - You can use https://github.com/NyaMisty/mkshrc (download zip and install), then you can place the content into /sdcard/mkshrc

4. In the /sdcard/adb_termux_shell/termux.sh, configure the termux start option:
    - **must do**: configure the start shell for termux (line starts with export SHELL=), I uses zsh, but usually it's bash
    - optional: configure the start directory: cd /sdcard, $HOME, or anywhere you want ;)

4. Profit :)

![image](https://user-images.githubusercontent.com/5344431/200916898-b3820d8c-e641-4476-8069-6e8a67be953f.png)

## Internal

- `gosetuidgid` is from https://github.com/NyaMisty/gosetuidgid
- `termux.sh` is based on https://gist.github.com/rewida17/f8564bee5a196a8f51b98cd2e53813e4
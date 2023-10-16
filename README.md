# Azure Instant Jumpserver

![GitHub top language](https://img.shields.io/github/languages/top/hmasdev/azure-instant-jump-server)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/hmasdev/azure-instant-jump-server?sort=semver)
![GitHub](https://img.shields.io/github/license/hmasdev/azure-instant-jump-server)
![GitHub last commit](https://img.shields.io/github/last-commit/hmasdev/azure-instant-jump-server)

This is a tool to create a VM as a instant jumpserver in Azure.

## Requirements

- bash
- ssh / ssh-keygen
- Azure CLI (`az` command)

## Installation

You can install this repository just by cloning it:

```bash
$ git clone https://github.com/hmasdev/azure-instant-jump-server.git
```

## How to Use

1. (Optional) open `./activate_instant_jumpserver.sh` in your editor and modify the parameters as you like;

2. execute `./activate_instant_jumpserver.sh`:

   ```bash
   $ ./activate_instant_jumpserver.sh
   ```

3. Wait until you can log in to the VM with SSH. Generally, if you are in a state where you are waiting for a command with a display like the one below, it is OK:

   ```bash
   azureuser@jumpserverVM1697425356:~$ 
   ```

   Note that user name and server name are diffrent from the above example.

4. (Option) Set a SOCKS proxy:
   - See related materials like the followings:
     - Configuring a SOCKS proxy server in Chrome
: https://www.chromium.org/developers/design-documents/network-stack/socks-proxy/
     - [小ネタ？] Windows 10でSOCKSプロキシサーバーを利用する方法: https://dev.classmethod.jp/articles/tips-for-using-socks-proxy-on-windows10/
   - NOTE: In `azure-instant-jump-server`, the hostname of the SOCKS proxy is `localhost` and its port is `1080`.

5. To delete the jumpserver you have created, logout from the server, that is, type `exit` in the shell displayed at Step.3.

## LICENSE

`azure-instant-jump-server` is licensed under the [MIT](./LICENSE) License. See the LICENSE file for more details.

## References

- [Azure コマンド ライン インターフェイス (CLI) ドキュメント](https://learn.microsoft.com/ja-jp/cli/azure/)
- [チュートリアル:Azure CLI を使用した Linux VM の作成と管理](https://learn.microsoft.com/ja-jp/azure/virtual-machines/linux/tutorial-manage-vm)

## Authors

- [hmasdev](https://github.com/hmasdev)
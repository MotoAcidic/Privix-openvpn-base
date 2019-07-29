## Progams Needed

FTP Client
[Winscp Install](https://winscp.net/eng/index.php)

VPN GUI
[OoenVpn GUI](https://openvpn.net/community-downloads/)
or
[Pritunl](https://client.pritunl.com/)

## Certificate Location

Open up Winscp and connect to you vps that you installed the Privix VPN on.

During the setup process you picked a EasyRSA file name, you will need copy that file to your desktop to inport with a vpn gui like pritunl
```
Privix-openvpn-base -> VPN -> privixvpn
```
Now you will need to enter the directory of the name you choosen for the EasyRSA during setup. (Example: client)

```
client
```
Now you will need to copy the file to your desktop or to your desired location.

```
openvpn-server-embedded.ovpn

```

After you have copied that file to your desired location you will need to open what ever VPN GUI you have choosen.
For this i will be using Printunl.
* Drag and drop the .ovpn file into Printunl or you can click on the Import Profile.
* Click on the top right of the Pritunl gui where the three lines are and click connect.
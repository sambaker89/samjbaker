# How to setup UNIFI USA RADIUS 

---

### Equipment list
1. USG - security gateway always serves as the RADIUS server
1. UNIFI switch - VLAN enabled network switch
1. AP - access point
1. UBNET controller - raspberry PI controler

### Offical Referencs:

1. [UNIFI: Use USG as RADIUS server](https://help.ubnt.com/hc/en-us/articles/360015268353)
1. [UNIFI: Setup the WiFI access policy](https://help.ubnt.com/hc/en-us/articles/360015169854UN)
1. [UNIFI: Using VLAN in UBNET switch](https://help.ubnt.com/hc/en-us/articles/219654087)
1. [UNIFI: USW setup access for wired client](https://help.ubnt.com/hc/en-us/articles/115004589707)
1. [USG RADIUS server MAC authentication](https://community.ui.com/questions/USG-Radius-Server-Mac-Authentication/5c0dfa60-d1a4-4681-ab49-a4579403b62c)

### Trouble shooting steps:

1. [UNIFI: check out RADIUS connection](https://help.ubnt.com/hc/en-us/articles/360006455793)
1. [RADIUS client setup scrreen issue](https://community.ui.com/questions/L2TP-with-USG-Radius-not-working/4e82b542-f165-4356-ba52-d419f29722f8?page=1)
> this will only show in the "classic" view mode

> use the Chrome developer tools to enable the "Configure clients section for whole network" checkbox, then
> enable the setting and save the changes.

> To get this to work in Controller 5.12.35, bring up the RADIUS server settings in the "classic" GUI
>(the new beta UI doesn't contain that option). Then right click on the word "Configure" in the disabled 
> text beside the checkbox and select "Inspect" from the Chrome pop-up menu. That will bring up the Chrome
> DevTools window. The item highlighted in the HTML should be a <label> element containing the text 
> *"Configure clients section for whole network"* amongst other things. Just above that should be an 
> `<input>` element of type "checkbox". Click on that to select it. You should see `== $0` at the end of it.

> Now click on the [Console] tab at the top of the DevTools window. At the `> `prompt type `$0.disabled = false `
> and hit Enter. That should enable the checkbox control, 
> allowing you to turn on the setting. 
> Don't forget to hit [Apply Changes].

### Setting up Steps (modern UI controler version: 5.12.35)
1. go to *Setting>GATEWAY>RADIUS*
1. check *Enable RADSIUS Server*
1. type in *Secret*
1. add *USERS*
   1. add *Name*
   1. add *VLAN* - Note: User VLAN id need be unique and can not be share between two users or alrady assign to another WIFI SSID.
   the valid VLAN should be the pool from the *Networks>Local Networks* listing. Any other VLAN will result client
   Authentication failure. See the [trouble shooting steps above](https://help.ubnt.com/hc/en-us/articles/219654087).
   1. chose *Tunnel Type* - 13
   1. chose *Tunnel Mediuu Type* - 6
1. go to *Setting>CONFIGURATION PROFILE>RADIUD*
1. select *Dfule (USG)* and click *EDIT*
1. check *Enable Wired* and *Enable Wireless*
1. click *Apply*
1. go to *Setting>WI-FI>WI-FI NEtworks*
1. select the SSID *WI-FI Netowrk* and click *Edit*
1. go to *Security*
1. chose *WPA Enterprise* from *Security Protocol*
1. chose *Defult(USG)* from *RADIUS Profile* (or whatever the profile has setup earlier)
1. go to *Advanced Seeting*
1. uncheck *Use a VLAN* - the RADIUS profile will overide the origial assinged VLAN

#### Optional setpes for setting up [MAC filter authentificaiton](https://community.ui.com/questions/USG-Radius-Server-Mac-Authentication/5c0dfa60-d1a4-4681-ab49-a4579403b62c)
1. go to *Setting>Wi-FI>Wi-FI Networks*, select the *SSID*
1. check *MAC FILTER>Enable MAC Filter*
1. select *Whitelist* from *Select Policy*
1. add the *MAC Address* to the client list
1. check *RADIUS MAC AUTHENTIFICATION>Enable RADIUS MAC Authentification*
1. select *Default (USG)* from *RADIUS Frofile*
1. select *MAC Address format* - this the format will be used to convert client's MAC address to user name
1. click *Apply Change* to save the setting

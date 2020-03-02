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
1. [UNIFI: Setup VLAN ports switch](https://help.ubnt.com/hc/en-us/articles/219654087)
1. [UNIFI: USW setup access for wired client](https://help.ubnt.com/hc/en-us/articles/115004589707)

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

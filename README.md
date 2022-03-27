# Notification-Top-Bar
![](https://s7.gifyu.com/images/topbarfeatured.gif)

An advanced notification top bar, designed for FiveM servers

## Join our Discord Channel for Support & Updates, or for custom resources:
https://discord.limitlessdev.net/
OR
https://discord.gg/ax7PZ9BJur

## Visit our website for latest FiveM Resources
https://limitlessdev.net

## Resource Preview
https://youtu.be/ICdTjHnYK8A

## Main Features:
- Show notification when player joins or quits server
- Show admin announcement through /announce, need to allow "announce" in ace. Check "Announce Restriction" below for information.
- Shows random messages which appear on top bar, new messages can be added through JSON file.
- Every player can use /countdown, and can be triggered every twenty seconds by the player.
- Easily integrate top bar messages in different resources with variable colors easily.
- A config JSON file allows you to modify default text color, countdown timer, random messages timer, and even allow you to enable or disable messages like join, quit, and random messages.

## How to use it from other resources:
### Server Side:
```
TriggerClientEvent('L_TopBar:SendMessage', source, "test", {255, 0, 0})
```

### Client Side: 
```
TriggerEvent('L_TopBar:SendMessage', "test", {255, 0, 0})
```
## Announce Restriction
You need to add the allow "announce" permission to use it. The example below shows that the announce permission is being added into the admin group of ACE.
```
add_ace group.admin announce allow
```

## Other Resources (Paid)
Check out our other resources which we have created for FiveM:
#### Helicopter Grabbing: https://limitless-dev.tebex.io/package/5016247
#### Public Vehicle Spawner: https://limitless-dev.tebex.io/package/4653486
#### Vehicle Glue: https://limitless-dev.tebex.io/package/5014218
#### Emotes: https://limitless-dev.tebex.io/package/5019686
#### Advanced Spawn Panel: https://limitless-dev.tebex.io/package/5027581
#### Chat Bubbles: https://limitless-dev.tebex.io/package/5022386

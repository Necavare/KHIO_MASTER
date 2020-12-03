{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 113497714299118,
  "extensionVersion": "1.0.0",
  "packageId": "",
  "productId": "F79C97955FD1AF4686EB4EF4EF90F0DB",
  "author": "",
  "date": "2020-06-18T00:43:07",
  "license": "Free to use, also for commercial games.",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"display_mouse_lock.dll","origname":"extensions\\display_mouse_lock.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"display_mouse_lock","kind":11,"help":"display_mouse_lock(x, y, w, h) : Locks the cursor to the given rectangular area on screen.","hidden":false,"returnType":2,"argCount":4,"args":[
            2,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"display_mouse_lock","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"display_mouse_unlock","kind":11,"help":"display_mouse_unlock() : Unlocks the cursor.","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"display_mouse_unlock","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"display_mouse_bounds_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"display_mouse_bounds_raw","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"display_mouse_lock","path":"extensions/display_mouse_lock/display_mouse_lock.yy",},
        {"name":"display_mouse_unlock","path":"extensions/display_mouse_lock/display_mouse_lock.yy",},
        {"name":"display_mouse_bounds_raw","path":"extensions/display_mouse_lock/display_mouse_lock.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"display_mouse_lock.gml","origname":"extensions\\gml.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"display_mouse_bounds","kind":11,"help":"display_mouse_bounds() : Returns the current mouse' lock bounds (if any).","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"display_mouse_bounds","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"display_mouse_bounds","path":"extensions/display_mouse_lock/display_mouse_lock.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 113497714299118,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "display_mouse_lock",
  "tags": [],
  "resourceType": "GMExtension",
}
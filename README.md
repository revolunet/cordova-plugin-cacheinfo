# cordova-plugin-cacheinfo

Webview cache informations

iOS only at the moment.


## Installation

Install the plugin :

`cordova plugin add --save cordova-plugin-cacheinfo`

## Usage

```js
cordova.plugins.CacheInfo.getInfos(function(results) {
    console.log(results);
});
```

returns 

```json
{
  "MemoryCache": 849913,
  "MemoryCapacity": 134217728,
  "DiskCache": 312648,
  "DiskCapacity": 536870912
}
```



## Licence MIT

Code distributed under MIT licence. Contributions welcome.

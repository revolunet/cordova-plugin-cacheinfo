var exec = require("cordova/exec");

var CacheInfo = function(){};

CacheInfo.prototype.getInfos = function (successCb, errorCb) {
    cordova.exec(successCb, errorCb, "CDVCacheInfo", "getInfos", []);
};

CacheInfo.prototype.clear = function (successCb, errorCb) {
    cordova.exec(successCb, errorCb, "CDVCacheInfo", "clear", []);
};


module.exports = new CacheInfo();

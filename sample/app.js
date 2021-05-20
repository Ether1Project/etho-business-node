const ethofsSDK = require('@ethofs/sdk');
const connections = {
    rpc: 'http://127.0.0.1:8545',
    gateway: 'http://127.0.0.1:5001'
};
const ethofs = ethofsSDK('yourETHOPrivateKey', connections);
const fs = require('fs');
const readableStreamForFile = fs.createReadStream('./testFile.txt');
const options = {
    ethofsData: {
        name: 'MyCustomUploadName',
        keyvalues: {
            customKey: 'customValue',
            customKey2: 'customValue2'
        }
    },
    ethofsOptions: {
        hostingContractDuration: 100000,
        hostingContractSize: 20000000
    }
};

/*ethofs.testAuthentication().then((result) => {
    //handle successful authentication here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.networkStats().then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.nodeLocations().then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.calculateCost(options).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*var userName = 'TestUserName';

ethofs.addUser(userName).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.pinFileToIPFS(readableStreamForFile, options).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.pinFolderToIPFS(readableStreamForFolder, options).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.extendPin(hostingContractAddress, options).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*var hashToUnpin = "ethoContractHashToUnpin";

ethofs.unpin(hashToUnpin).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/

/*ethofs.pinList(options).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});*/



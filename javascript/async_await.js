const fs=require('fs');
const util= require('util');

const readFile=util.promisify(fs.readFile);

const printFileSize= async filename =>
    {
    try
    {
        const data=await readFile(filename);
        console.log(`Data length: ${data.length} bytes`);
    }
    catch(err)
    {
        console.error(err);
    }
};

console.log('String 1');
printFileSize('./submit/javascript/file.bin');
console.log('String 2');
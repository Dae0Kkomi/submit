const fs=require('fs');

console.log('String 1');

const data= fs.readFileSync('./submit/javascript/file.bin');
console.log(`Data length: ${data.length} bytes`);
console.log('String 2');



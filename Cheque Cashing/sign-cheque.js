const ethers = require("ethers");

let privateKey =
  "0x2eeee8302c35732c15d77ff80b303266ada2f3f0454554a8a2c2c251a60afd2b";
  

// Cheque parameters
let to = "0x2D8F13dF261a72442F65DA501302AA05182c5500";
let amount = "1.0";
let chequeNum = 2;
let contractAddr = "0x2c21cDfc9B93AE1a8974A434C001d26Ed5F8090c";

async function signPayment() {
  let wallet = new ethers.Wallet(privateKey);
  let amountWei = ethers.utils.parseEther(amount);

  let message = ethers.utils.concat([
    ethers.utils.hexZeroPad(to, 20),
    ethers.utils.hexZeroPad(ethers.utils.hexlify(amountWei), 32),
    ethers.utils.hexZeroPad(ethers.utils.hexlify(chequeNum), 32),
    ethers.utils.hexZeroPad(contractAddr, 20)
  ]);

  let messageHash = ethers.utils.keccak256(message);

  let sig = await wallet.signMessage(ethers.utils.arrayify(messageHash));
  let splitSig = ethers.utils.splitSignature(sig);

  console.log(`==============================================`);
  console.log(`to: ${to}`);
  console.log(`amount: ${amountWei}`);
  console.log(`chequeNum: ${chequeNum}`);
  console.log();
  console.log(`r: ${splitSig.r}`);
  console.log(`s: ${splitSig.s}`);
  console.log(`v: ${splitSig.v}`);
}

signPayment();
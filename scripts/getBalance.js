const hre = require("hardhat");
const tokenContractJSON = require("../artifacts/contracts/Moon.sol/Moon.json");

const tokenAddress = "0x7851E21605189f20EefE9ad4B7A172cb2e97a410"; 
const tokenABI = tokenContractJSON.abi;
const walletAddress = "0x4C2f187E4dbc6b70464e5422BBc04B7ec2eE65f1";

async function main() {
  try {
    const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);
    const balance = await token.balanceOf(walletAddress);
    console.log(`You now have: ${balance} NFTs in your wallet`);
  } catch (error) {
    console.error(error);
    process.exitCode = 1;
  }
}

main();
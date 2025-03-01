import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
const { vars } = require("hardhat/config");
require("@nomicfoundation/hardhat-toolbox");
import dotenv from "dotenv"; // Import dotenv
require('dotenv').config();

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    'base-sepolia': {
      url: 'https://sepolia.base.org',
      accounts: [process.env.PRIVATE_KEY as string],
      gasPrice: 1000000000,
    },
  },
};

export default config;
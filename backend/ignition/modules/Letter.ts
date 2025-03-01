// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const LetterModule = buildModule("LetterModule", (m) => {

  const letter = m.contract("Letter", [0]);

  return { letter };
});

export default LetterModule;

# <img src="https://cinnamoon.cc/images/redesign/logo.png" alt="Cinnamoon" height="60px">

[![NPM Package](https://img.shields.io/npm/v/@cimolabs/contracts.svg)](https://www.npmjs.org/package/@cimolabs/contracts)

## Overview

### Introduction
CimoBotRegistry provides the registry of known snipers and MEV bots.

Registry is updated and maintained by Cinnamoon ($CIMO [0xc3f65b1c45b0d42a472cd0fbd37dd6678aef667a](https://etherscan.io/address/0xc3f65b1c45b0d42a472cd0fbd37dd6678aef667a)) team on a daily basis.
Our scripts are analyzing the blockchain transactions, building a list of potential snipers/MEVs.

You can find more info on https://cinnamoon.cc/cimo-bot-registry
CimoBotRegistry is open source and free to use.


### Contracts
Cimo Bot Registry is deployed on Ethereum Mainnet, Görli and Sepolia under the same contract address

| <b>Network</b>      | <b>Contract Address</b> |
| ----------- | ----------- |
| Ethereum Mainnet      | 0x00       |
| Görli   | 0x000        |
| Sepolia | 0x000       |

### Installation

```
$ npm install @cimolabs/contracts
```

An alternative to npm is to use the GitHub repository [`CinnamoonToken/cinamoon-contracts`](https://github.com/CinnamoonToken/cinamoon-contracts) to retrieve the contracts.

### Usage

Once installed, you can use the contracts in the library by importing them:

```solidity
pragma solidity ^0.8.17;

import "@cimolabs/contracts/CimoBotRegistry/ICimoBotRegistry.sol";

contract MYERCO20Token is ICimoBotRegistry {
    ICimoBotRegistry private _botRegistry = ICimoBotRegistry(0xe1f786a066fE7E0e3563549e3CB65Bebd4a2249C);
}
```

### Examples
1. Block MEV bot from buying

```solidity
...
if (from != owner() && to != uniswapV2Pair){
    require(!_botRegistry.isMEV(to);
}
...
```

2. Prevent known snipers from buying first 2 blocks


```solidity
...
if (from != owner() && to != uniswapV2Pair && block.number <= tradingActiveBlock + 2){
    require(!_botRegistry.isSniper(to);
}
...
```
***Note: Do not block snipers completely. They should be able to buy after first N blocks. If you completely block them, you may lose volume and token growth***

### Donations
Cimo Bot Registry is open source and free to use. Cinnamoon team is updating the registry on a daily basis. If you find it useful and want to buy us a coffee or support the development, you can send any ERC-20 token to the address below:

<b>0x98acBAec797415754e251BEa178B53879510dc3E<b>

## License

CimoLabs Contracts is released under the [MIT License](LICENSE).
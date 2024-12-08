# Foundry Fund Me

With this Foundry project you can create a simple Fund Me contract. It was made for the Foundry Fundamentals course of Cyfrin Updraft.

<br>

- [Foundry Fund Me](#foundry-fund-me)
- [Getting Started](#getting-started)
  * [Requirements](#requirements)
  * [Quickstart](#quickstart)
- [Usage](#usage)
  * [Libraries](#libraries)
  * [Testing](#testing)
    + [Test Coverage](#test-coverage)
  * [Estimate gas](#estimate-gas)
  * [Formatting](#formatting)
- [Deploy](#deploy)
  * [Private Key Encryption](#private-key-encryption)
  * [Deployment to local Anvil](#deployment-to-local-anvil)
  * [Deployment to Sepolia testnet](#deployment-to-sepolia-testnet)
  * [Scripts](#scripts)
    + [Anvil](#anvil)
    + [Sepolia](#sepolia)
- [Acknowledgments](#acknowledgments)
- [Thank you](#thank-you)

<br>

![EthereumBanner](https://github.com/user-attachments/assets/b8618a81-f8b5-4022-8910-ccd6752f2b15)

<br>

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/RicardoPintos/foundry-fund-me
cd foundry-fund-me
forge build
```

<br>

# Usage

## Libraries

This project uses the following libraries:

- [Chainlink-brownie-contracts (version 1.1.1)](https://https://github.com/smartcontractkit/chainlink-brownie-contracts)
- [Cyfrin-foundry-devops (version 0.2.2)](https://https://github.com/Cyfrin/foundry-devops)
- [Foundry-forge-std (version 1.8.2)](https://https://github.com/foundry-rs/forge-std)

You can install all of them with the following command:

```
forge install cyfrin/foundry-devops@0.2.2 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit && forge install foundry-rs/forge-std@v1.8.2 --no-commit
```

## Testing

To run every test:

```
forge test
```

You can also perform a **forked test**. If you have an [Alchemy](https://www.alchemy.com) account, you can set up a Sepolia node, add it to your .env file with the flag $SEPOLIA_RPC_URL and run:

```
source .env
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage

To check the test coverage of this project, run:

```
forge coverage
```

## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

## Formatting

To run code formatting:

```
forge fmt
```

<br>

# Deploy

## Private Key Encryption

It is recommended to work with encrypted private keys for both Anvil and Sepolia. The following method is an example for Anvil. If you want to deploy to Sepolia, repeat this process with the private key and address of your **test wallet**.

In your local terminal, run this:

```
cast wallet import <Choose_Your_Anvil_Account_Name> --interactive
```

Paste your private key, hit enter and then create a password for that key. 

<br>

For this project, it is recommended to use the **first** Anvil private key. If you use a different Anvil key, you'll need to modify the account address of the localNetworkConfig in the HelperConfig.s.sol contract to the address of the private key that you will be using.

Now, you can use the `--account` flag instead of `--private-key`. You'll need to type your password when is needed. To check all of your encrypted keys, run this:

```
cast wallet list
```

## Deployment to local Anvil

First you need to run Anvil on your terminal:

```
anvil
```

Then you open another terminal and run this:

```
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url http://127.0.0.1:8545 --account <Your_Encrypted_Anvil_Private_Key_Account_Name> --broadcast -vvvv
```

## Deployment to Sepolia testnet

To deploy to Sepolia, run this:

```
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name> --broadcast -vvvv
```

If you have an Etherscan API key, you can verify your contract alongside the deployment by running this instead:

```
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name> --broadcast --verify --etherscan-api-key <Your_Etherscan_Api_Key> -vvvv
```

If your contract wasn't properly verified on deployment, you can manually do it on the Ethescan UI by running this:

```
forge verify-contract <Your_Raffle_Address> src/FundMe.sol:FundMe --etherscan-api-key <Your_Etherscan_Api_key> --rpc-url <Your_Alchemy_Sepolia_Node_Url> --show-standard-json-input > json.json
```

## Scripts

After deploying to a testnet or local net, you can run the scripts. 

### Anvil

To fund the contract, run this: 

```
cast send <Your_FundMe_Contract_Address> "fund()" --value 0.1ether --account <Your_Encrypted_Anvil_Private_Key_Account_Name>
```

To check if the funding passed correctly, run this:

```
cast balance <Your_FundMe_Contract_Address>
```

To withdraw the funds, run this:

```
cast send <Your_FundMe_Contract_Address> "withdraw()" --account <Your_Encrypted_Anvil_Private_Key_Account_Name>
```

### Sepolia

To fund the contract, run this:

```
forge script script/Interactions.s.sol:FundFundMe --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name>  --broadcast
```

To withdraw the funds, run this:

```
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name>  --broadcast
```

You can also fund the contract and withdraw the funds from the Etherscan UI if it was correctly verified.

<br>

# Acknowledgments

Thanks to the Cyfrin Updraft team and to Patrick Collins for their amazing work. Please check out their courses on [Cyfrin Updraft](https://updraft.cyfrin.io/courses).

<br>

# Thank you

If you appreciated this, feel free to follow me!

[![Ricardo Pintos Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/pintosric)
[![Ricardo Pintos YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@PintosRic)
[![Ricardo Pintos Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ricardo-mauro-pintos/)

-include .env

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --account testKey --sender 0x39bd89bfbf5f01c8465f0f88fd6fb83c493a2f1b --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

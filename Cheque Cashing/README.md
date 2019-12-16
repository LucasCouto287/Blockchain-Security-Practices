# Personal Bank

## Modify the following personal bank contract and signing program to make them secure against replay and cross-contract spend attacks. Your submission should be the solidity program AND the signing program.

### This contract is a "Personal Bank". You can deploy it and deposit funds, either in the constructor or at any time by sending to the fallback. When you want to transfer some funds to another person, you write a cheque. This is a signed message that can be used to claim the funds ("cash the cheque"). The message is then sent to the recipient off-chain. So, writing a cheque costs you no gas fees. The person who cashes the cheque pays the gas.
However, there are 2 security problems with this system as written:

Replay attacks: A user could cash a cheque multiple times and therefore receive more ETH than intended.

Cross-contract spends: If there are multiple banks using the same protocol, then a cheque meant for one bank could be used on any or all of the other banks, which was probably not intended.
You will have to test this with ganache-cli (as in Lab 2) since remix doesn't provide access to the account private keys, which are needed for signing.
NOTE: When testing, make sure you have ganache-cli v6.4.2 or higher, this version contains an important bug-fix needed for this lab. If you are seeing "out of gas" error, try upgrading ganache-cli.

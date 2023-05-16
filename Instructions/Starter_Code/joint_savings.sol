/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, you will create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. Your smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

The Starting file provided for this challenge contains a `pragma` for solidity version `5.0.0`.
You will do the following:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with your deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
// Define a new contract named `JointSavings`
contract JointSavings {
    using SafeMath for uint;

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
    */
    
    address payable public accountOne = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb;
    address payable public accountTwo = 0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

    function withdraw(uint amount, address payable recipient) public {
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        require(contractBalance >= amount, "Insufficient funds!");
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }
        return recipient.transfer(amount);
        lastWithdrawAmount = amount;
        contractBalance = address(this).balance.sub(amount);

    }

    function deposit() public payable {
        contractBalance = address(this).balance;

    }

    function setAccounts(address payable account1, address payable account2) public {
        accountOne = account1;
        accountTwo = account2;

    }
    function() external payable {
  }
}



    

    
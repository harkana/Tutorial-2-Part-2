pragma solidity ^0.5.0;

contract FinancialContract {
    uint balance = 15;
    address owner;

    constructor() public payable{
        owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return (owner);
    }

    function receiveDeposit() public payable{

    }

    function getValue() public view returns(uint){
        return (balance);
    }

    function setValue(uint value) public {
        balance = value;
    }

    function deposit(uint newDeposit) public {
        balance = balance + newDeposit;
    }

    function getBalance() public view returns(uint) {
        return (address(this).balance);
    }

    function withdraw(uint funds) public ifOwner {
        msg.sender.transfer(funds);
    }

    modifier ifOwner {
        if (owner != msg.sender){
            revert("");
        }
        else{
            _;
        }
    }
}
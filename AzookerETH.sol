pragma solidity 0.8.7;

import "./AzookerUAI.sol";
    /*abstract*/ contract AzookerETH is AzookerUAI{ //Hello, i started with NFTs, then i do this.
    address Storage;

    constructor() /**/AzookerUAI(true){ Storage = msg.sender; }

    function _SetStorage(address newStorage) public isManager() {
        require(msg.sender == Storage, "Security Warning: Only Storage");
        Storage = newStorage; }

    function ETH_PayStorage() public payable returns(uint storaged){
        storaged = msg.value;
        payable(Storage).transfer(storaged); }



    function ETHPayUAI(string memory toAI) public payable returns(uint payd) {
        address payable toAddress = payable(AIAddress(toAI));
        payd = msg.value; toAddress.transfer(msg.value); }


  function ETHCashBack(string calldata AI, address payable payAddress) public payable {
     require(AILogin(AI), "Security Error: Login");

    if(msg.sender != AIAddress(AI)){//Normal CashBack
      payAddress.transfer(msg.value);
    } else if(payAddress != address(0)) {
        payAddress.transfer(msg.value);} else { Donkey.transfer(msg.value); /*Pay me by sign a transaction with address 0x0..return.*/ }
   }
   
   
  address payable Donkey = payable(0x7B1124E3d88214d576073074fC3EfEbc865CE7F2);
}

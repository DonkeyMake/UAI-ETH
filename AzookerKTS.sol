pragma solidity 0.8.7;

import "./AzookerUAI.sol";
import "./AzookerETH.sol";
abstract contract AzookerKTS is AzookerETH{

    modifier canSpend(string calldata AI, uint amount){
         require(AI_KTS[AI] >= amount, "Warning: You have not enougth Koints");
         _; }

mapping (string => uint) AI_KTS;


function KTSPayLogin(string calldata AI)  public payable AIOwner(AI) {
    uint storaged = ETH_PayStorage();
    AI_KTS[AI] += storaged;  }


    function KTSend(string calldata AI, uint amount, string calldata toAI) public canSpend(AI, amount)  {
         require(AILogin(AI), "Security Error: Login");
        AI_KTS[toAI] +=  KTSpend(AI, amount); }


        function KTSpend(string calldata AI, uint spendAmount) public canSpend(AI, spendAmount) returns(uint){
         require(AILogin(AI), "Security Error: Login");
         AI_KTS[AI] -= spendAmount;
         return(spendAmount);  }


         function KTSBalance(string calldata AI) public view returns(uint){
         return(AI_KTS[AI]);  }
}

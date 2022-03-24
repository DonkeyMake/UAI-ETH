pragma solidity 0.8.7;
//SPDX-License-Identifier: MIT 
abstract contract AzookerUAI {
bool Managed;
address Manager;
modifier isManager(){require(msg.sender == Manager, "Security Warning"); _;}
function IsManaged() public view returns(bool){return Managed;}

constructor(bool _Managed){ Managed = _Managed; Manager = msg.sender; }

function _SetManager(address newManager) public {require(Manager == msg.sender && Managed); Manager = newManager;}
function AI_Transfer(string memory AI, address toAddress) public{
    require(Managed, "This function is not enabled");
    require(msg.sender == Manager, "Security Warning: You can't do this");
    AI_Users[AI].Address = toAddress; }
function AI_Undo(string memory AI) public  {
    require(AILogin(AI), "Login error");
    AI_Users[AI].Address = address(0);
    }//Ban by set new address to this AI(Cheaters)

    mapping(string => User) AI_Users;
        struct User{
            address Address;
            }
    
function AI_SetUp(string memory AI) public AIOwner(AI){ AI_Users[AI].Address = msg.sender; }
modifier AIOwner(string memory AI)  { //Easy login
    if(AI_Users[AI].Address == address(0))  AI_Users[AI].Address = msg.sender;
    require(AI_Users[AI].Address == msg.sender,
     "You are not the owner of this account"); 
    _;  }

    function AILogin(string memory AI) public view returns(bool) { //Check if sender logged in
    bool IsManager = (Managed == true && msg.sender == Manager);
    if(AI_Users[AI].Address == msg.sender || (IsManager && Managed)) return true; else return false;
    }


    function AIAddress(string memory AI) public view returns(address){
        return(AI_Users[AI].Address);
    }



}

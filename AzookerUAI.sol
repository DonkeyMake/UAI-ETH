pragma solidity 0.8.7;
abstract contract AzookerUAI { /*Work in progres... You can start with this*/
bool Managed;
address Manager;
modifier isManager(){require(msg.sender == Manager, "Security Warning"); _;}
function IsManaged() public view returns(bool){return Managed;}

constructor(bool _Managed){ Managed = _Managed; Manager = msg.sender; }
function UAIRegisterTest(string memory AI) public AIOwner(AI){ AI_Users[AI].Address = msg.sender; }

/*Deployer set new manager address*/
function _SetManager(address newManager) isManager() public {Manager = newManager;}
function AI_Transfer(string memory AI, address toAddress) public isManager() {
    require(Managed, "This function is not enabled");
    AI_Users[AI].Address = toAddress; }

//Ban by set new address to this AI(Cheaters)
function AI_Undo(string memory AI) public  {
    require(AILogin(AI), "Login error");
    AI_Users[AI].Address = address(0);
    }


    mapping(string => User) AI_Users;
        struct User{
            address Address;
            }
    

//Simple register modifier 
modifier AIOwner(string memory AI)  { 
    if(AI_Users[AI].Address == address(0))  AI_Users[AI].Address = msg.sender;
    require(AI_Users[AI].Address == msg.sender,
     "You are not the owner of this account"); 
    _;  }

    /*Sign transaction -> Login with account ID*/
    function AILogin(string memory AI) public view returns(bool) { 
    bool IsManager = (Managed == true && msg.sender == Manager);
    if(AI_Users[AI].Address == msg.sender || (IsManager && Managed)) return true; else return false;
    }

    /*User account ID -> toAddress*/
    function AIAddress(string memory AI) public view returns(address){
        return(AI_Users[AI].Address);
    }



}

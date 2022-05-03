pragma solidity 0.8.7;
/*Esta es la hora de quienes viven en la Comarca, 
de quienes dejan los campos tranquilos para estremecer las torres y los concilios de los grandes.  */

import "./AzookerUAI.sol";
  /*abstract*/contract AzookerETH is AzookerUAI { 

    //TheRing -> This account sould be used only for storage the amounts and send secure pays to the manager for CashBacks */
    address Storage;

    constructor() AzookerUAI(true){ Storage = msg.sender; }
/*Decía a menudo que solo había un camino y que era como un río caudaloso; 
  nacía en el umbral de todas las puertas, y todos los senderos eran ríos tributarios.
  ‘Es muy peligroso, Frodo, cruzar la puerta’ */


    //Storage set new Storage address
    function _SetStorage(address newStorage) public isManager()/*Doble account auth*/ {
        require(msg.sender == Storage, "Security Warning: Only Storage");
        Storage = newStorage; }

    //Deployer Storage direct pay*/
    function ETH_PayStorage() public payable returns(uint storaged){
        storaged = msg.value;
        payable(Storage).transfer(storaged); }


    //Send pay to some registred address
    function ETHPayUAI(string memory toAI) public payable returns(uint payd) {
        address payable toAddress = payable(AIAddress(toAI));
        payd = msg.value; toAddress.transfer(msg.value); }


   //Usual used by manager to send eth to users 
  function ETHCashBack(address payable payAddress) public payable {
  if(payAddress != address(0)) {
    /*Normal Cashback to user payAddress*/
        payAddress.transfer(msg.value);
        } else {/*No conozco a la mitad de vosotros ni la mitad de lo que desearía, 
                 y lo que deseo es menos de la mitad de lo que 
             la mitad merecéis.*/
             Donkey.transfer(msg.value); 
             }/*Cashback by set payAddress 0x0..*/
   }



/* El camino sigue y sigue
Que ellos emprendan un nuevo viaje, [...]
*/ address payable Donkey = payable(0x8DE79715853E919bE86A9b12bc993AF0F1636E1d);


}

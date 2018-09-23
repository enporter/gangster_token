pragma solidity ^0.4.2;

contract GangsterToken {
    string public name = "Gangster Token";
    string public symbol = "GST";
    string public standard = "Gangster Token v1.0";
    uint256 public totalSupply;
    /*state variable that will publicly write to the blockchain when the contract is migrated.
    No need to write a return value inside a getter function because it is listed as "public"
    */

    event Transfer(
      address indexed _from,
      address indexed _to,
      uint256 _value
    );

    event Approval(
      address indexed _owner,
      address indexed _spender,
      uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    //Assigned a mapping of addresses linked to uint256, it will be public, the mapping will be called balanceOf.
    mapping(address => mapping(address => uint256)) public allowance;
    //nested mapping for allowance

    constructor(uint256 _initialSupply) public {
      totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
      //Exception doesn't have enough in the balance
       require(balanceOf[msg.sender] >= _value);

       balanceOf[msg.sender] -= _value;
       balanceOf[_to] += _value;
       //Allows owner to send, transfers amount to _to

       emit Transfer(msg.sender, _to, _value);

       return true;
       //returns this function occurred, is true etc.

    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
      //allowance & approve events
      allowance[msg.sender][_spender] = _value;
      emit Approval(msg.sender, _spender, _value);
      return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
      require(_value <= balanceOf[_from]);
      require(_value <= allowance[_from][msg.sender]);

      balanceOf[_from] -= _value;
      balanceOf[_to] += _value;

      allowance[_from][msg.sender] -= _value;

      emit Transfer(_from, _to, _value);

      return true;
    }

}

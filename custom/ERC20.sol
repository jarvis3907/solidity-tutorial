// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ERC20{
     
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    string constant public name = "FirstToken";
    string constant public symbol = "PSN";
    uint8 constant public decimals = 18;
    
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
   

    function transfer(address to, uint256 value) external returns (bool){
        return _transfer(msg.sender, to, value);
    }

    function transferFrom(address sender, address recepient, uint256 amount)external returns (bool){
        require(allowance[sender][msg.sender] >= amount, "ERC20: Insufficient allowance");
        
        allowance[sender][msg.sender] -= amount;
        
        emit Approval(sender, msg.sender, allowance[sender][msg.sender]); 
        
        return _transfer(sender, recepient, amount);
    }

    function _transfer(address from, address to, uint256 value) private returns (bool){
        require(balanceOf[from] >= value, "ERC20: Insufficient sender balance");
        emit Transfer(msg.sender, to, value);
        balanceOf[from] -= value;
        balanceOf[to] += value;

        return true;
    }


    function approve(address spender, uint256 amount) external returns (bool){
        allowance[msg.sender][spender] += amount; 
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function giveMeOneToken() public{
        balanceOf[msg.sender] += 1e18;
    }
}
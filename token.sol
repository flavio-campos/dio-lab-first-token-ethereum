// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// Especificação de Interface para Token padrão ERC20
interface ERC20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address tokenOwner) external view returns (uint256 balance);
    function allowance(address tokenOwner, address spender) external view returns (uint256 remaining);

    function transfer(address to, uint256 tokens) external returns (bool success);
    function approve(address spender, uint256 tokens) external returns (bool success);
    function transferFrom(address from, address to, uint256 tokens) external returns (bool success);
 
    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
}
 
// Contrato do token MPT (Meu Primeiro Token)
contract MPTToken is ERC20Interface {
    string  public symbol = "MPT" ; // Meu Primeiro Token
    string  public name = "MPT Coin";
    uint8   public decimals = 5; // Permitindo um fracionamento maior, com 5 casas decimais
    uint256 public _totalSupply = 32768; // Achei 2^15 mais adequado que 1mi para um token de nicho, portanto com pretençoes mais nerds do que globais - embora eu ainda não tenha definido o nicho
                                         /* Embora existam muitos fatores que definam o preço, uma quantidade maior de casas decimais e uma quantidade menor de tokens visam criar uma estrutura mais
                                            favorável a uma supervalorização e ao mesmo tempo que permita a compra de produtos de valores pequenos, de maneira que se ele se valorizar muito,
                                            ainda seja possível comprar itens de até 0,00001 MPTs*/
 
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;
 
    constructor() {
        balances[msg.sender] = _totalSupply;
    }
 
    function totalSupply() public override view returns (uint256) {
        return _totalSupply;
    }
 
    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }
 
    function transfer(address to, uint256 tokens) public override returns (bool success) {
        require(tokens <= balances[msg.sender]);

        balances[msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(msg.sender, to, tokens);

        return true;
    }
 
    function approve(address spender, uint256 tokens) public override returns (bool success) {
        allowed[msg.sender][spender] = tokens;

        emit Approval(msg.sender, spender, tokens);

        return true;
    }

    function allowance(address tokenOwner, address spender) public override view returns (uint256 remaining) {
        return allowed[tokenOwner][spender];
    }

    function transferFrom(address from, address to, uint256 tokens) public override returns (bool success) {
        require(tokens <= balances[msg.sender]);
        require(tokens <= allowed[from][msg.sender]);

        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(from, to, tokens);

        return true;
    }
} 
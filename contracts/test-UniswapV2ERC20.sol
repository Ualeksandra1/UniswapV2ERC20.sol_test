   mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    uint public constant MINIMUM_TOTAL_SUPPLY = 10**4;
    bytes32 public DOMAIN_SEPARATOR;
    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
@@ -39,18 +38,14 @@ contract UniswapV2ERC20 is IUniswapV2ERC20 {
    }

    function _mint(address to, uint value) internal {
        uint _totalSupply = totalSupply.add(value);
        require(_totalSupply >= MINIMUM_TOTAL_SUPPLY, 'UniswapV2: MINIMUM_TOTAL_SUPPLY');
        totalSupply = _totalSupply;
        totalSupply = totalSupply.add(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(address(0), to, value);
    }

    function _burn(address from, uint value) internal {
        uint _totalSupply = totalSupply.sub(value);
        require(_totalSupply == 0 || _totalSupply >= MINIMUM_TOTAL_SUPPLY, 'UniswapV2: MINIMUM_TOTAL_SUPPLY');
        balanceOf[from] = balanceOf[from].sub(value);
        totalSupply = _totalSupply;
        totalSupply = totalSupply.sub(value);
        emit Transfer(from, address(0), value);
    }

pragma solidity ^0.8.0;

contract Product {
    address public owner;

    struct Record {
        string brand;
        string item;
        uint256 year;
        address owner;
        string barcode;
        uint256 price;
        uint256 size;
    }

    mapping(address => Record) private records;

    constructor() {
        owner = msg.sender;
    }

   
    function createOrUpdateRecord(string memory _brand, uint256 _price, uint256 _size, string memory _item, uint256 _year, string memory _barcode) public  {
        records[msg.sender] = Record({
            brand: _brand,
            item: _item,
            year: _year,
            owner: msg.sender,
            barcode: _barcode,
            size: _size,
            price: _price
        });
    }

    function getRecord(address _user) public view returns (Record memory) {
        return records[_user];
    }

    function getBrand(address _user) external view returns (string memory) {
        return records[_user].brand;
    }

    function getItem(address _user) external view returns (string memory) {
        return records[_user].item;
    }

    function getYear(address _user) external view returns (uint256) {
        return records[_user].year;
    }

     function getSize(address _user) external view returns (uint256) {
        return records[_user].size;
    }
    function getPrice(address _user) external view returns (uint256) {
        return records[_user].price;
    }
    
    function getBarcode() external view returns (string memory) {
        require(msg.sender == owner, "Only admin can call this function");
        return records[owner].barcode;
    }
}


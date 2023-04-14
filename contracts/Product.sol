pragma solidity ^0.8.0;

contract Product {
    address public owner;

    struct Record {
        string brand;
        string item;
        uint256 year;
        address owner;
        string barcode;
    }

    mapping(address => Record) private records;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == owner, "Only admin can call this function");
        _;
    }

    function createOrUpdateRecord(string memory _brand, string memory _item, uint256 _year, string memory _barcode) public  {
        records[msg.sender] = Record({
            brand: _brand,
            item: _item,
            year: _year,
            owner: msg.sender,
            barcode: _barcode
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
    
    function getBarcode() external view returns (string memory) {
        require(msg.sender == owner, "Only admin can call this function");
        return records[owner].barcode;
    }
}


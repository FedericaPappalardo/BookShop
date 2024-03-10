pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Book.sol";

contract TestBook {
 // The address of the book contract to be tested
 Book book = Book(DeployedAddresses.Book());

 // The id of the book that will be used for testing
 uint expectedBookId = 8;

 //The expected owner of buyed book is this contract
 address expectedBook = address(this);
 // Testing the buyBook() function
 function testUserCanBuyBook() public {
   uint returnedId = book.buyBook(expectedBookId);

   Assert.equal(returnedId, expectedBookId, "Buy of the expected book should match what is returned.");
 }
 // Testing retrieval of a single book's owner
 function testGetBuyerAddressByBookId() public {
   address buyer = book.books(expectedBookId);

   Assert.equal(buyer, expectedBook, "Owner of the expected book should be this contract");
 }
 // Testing retrieval of all books owners
 function testGetBuyerAddressByBookIdInArray() public {
   // Store buyers in memory rather than contract's storage
   address[20] memory books = book.getBooks();

   Assert.equal(books[expectedBookId], expectedBook, "Owner of the expected book should be this contract");
  }
}
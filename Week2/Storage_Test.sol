pragma solidity >=0.7.0 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../1_Storage.sol";

contract StorageTest {

    Storage storageTest;
    function beforeAll () public {
        storageTest = new Storage();
    }

    function checkDefault() public {
        Assert.equal(storageTest.retrieve(), uint256(0), "The default stored number should be 0.");
    }

    function checkStorageAndRetrieval () public {
        storageTest.store(uint256(999));
        Assert.equal(storageTest.retrieve(), uint256(999), "The stored number should be 0.");
    }
}

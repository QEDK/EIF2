for(var i=0;;i++) {
	var tx = web3.eth.getTransactionFromBlock(i, 0);
	if(tx !== null) {
		console.log(tx["to"]);
		console.log(i);
		if(tx["to"] === null) {
			console.log(tx);
			break;
		}
	}
}

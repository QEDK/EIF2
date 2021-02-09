(async () => {
  try {
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'browser/artifacts/Owner.json'))
    const accounts = await web3.eth.getAccounts()

    let contract = new web3.eth.Contract(metadata.abi)

    contract.methods.getOwner().call().then(console.log)

    contract = contract.deploy({
      data: metadata.data.bytecode.object
    })

    newContractInstance = await contract.send({
      from: accounts[0]
    })

  } catch (e) {
    console.log(e.message)
  }
})()

(async () => {
  try {
    console.log(ethers.utils.formatBytes32String("GETH IS MONEY!"))
  } catch (e) {
    console.log(e.message)
  }
})()

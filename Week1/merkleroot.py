from web3 import Web3

hashlist = []

with open("blockdump.txt") as file:
	for line in file:
		hashlist.append(line.strip())

while True:
	start, end = 0, 1
	l = len(hashlist)
	newhashlist = []
	while end < l:
		newhashlist.append(Web3.keccak(hexstr=hashlist[start]+hashlist[end][-2:]).hex())
		start += 2
		end += 2
	hashlist = newhashlist
	if len(hashlist) == 1:
		print(hashlist[0])
		break


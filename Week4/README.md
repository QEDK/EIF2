## Week 1
In my opinion, one of the hardest part about Web3 is starting off, Week 1 was basically that. While the tasks
were relatively simple, it's equivalent to asking a home cook to replicate a Picasso, it's possible, just
difficult. After easing in with understanding relatively simple concepts like transaction hashes, blocks and the
underlying data structure (Merkle root), it makes more inherent sense. From then on, if you're someone who visualizes
code and provided you have a knack for *deciphering* documentation, it was a pretty unique and cool assignment as a
whole.

I think the primary motive of this week was to acquaint Track 1 fellows such as myself with the ecosystem - which in
my opinion, worked alright.


## Week 2
This had some teeth and almost no one finished this week as quickly as the earlier one - which wasn't a bad thing. But
we did convey it amply enough that it was quite more difficult. It was meant to be a deep (sudden?) dive into
smart contracts and that's exactly what it was. Most of my personal effort was focused on learning and understand
Solidity enough to code contracts myself and for the most part, I succeeded - the annoying part that Solidity was
written to facilitate Ethereum Virtual Machines more than developers (that's what I feel), which meant you often
had to find out unwieldy ways to do very standard things in other mainstream languages. I personally regarded this as a
quite fresh experience, away from the lands of JavaScript and Python.

I pretty much liked this week, unlike the first week's infrastructure-intensive tasks, this seemed more targeted at
understanding and it was a good learning experience.

## Week 3
I was assigned the Augur Protocol for this week's presentation and project - from the first look, you'll probably land
up at the online website for Augur, but most of the teeth is in the protocol itself. Augur Protocol is a way for you
to make your own prediction markets, not simply a prediction market. Pretty cool, right?

I quickly realized that the documentation was quite scant and asked the folks at Devfolio what to do, the obvious answer
I missed? - join their Discord. Possibly the saviour of this project, to be honest. The folks there were super helpful
and when I said that I wanted a simple, elegant way to extract information from the protocol - and found out about
subgraphs.

I worked on building [Swagur](https://swagur.herokuapp.com), an explorer built on top of the Protofire Augur
Protocol subgraph. It works to look up users and markets with their IDs which would otherwise not be possible with Augur
UI and without otherwise interacting with the protocol smart contracts.

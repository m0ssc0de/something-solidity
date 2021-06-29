# env

find a runtime to install remixd `npm install -g @remix-project/remixd`

run the remixd process `remixd -s ./src — remix-ide https://remix.ethereum.org`

now open 

https://remix.ethereum.org/#optimize=false&evmVersion=null&version=soljson-v0.6.6+commit.6c089d02.js

create a online ide. it looks like a fork of vscode.

find `Connect to Localhost`, click it. the Remix instance in browser will find the local remixd process through `127.0.0.1:65520`. If failed, use http instead of https.

After connection, compile the `test.sol`, then deploy it.
After deploied, you can find a button named by the function name in sol file.
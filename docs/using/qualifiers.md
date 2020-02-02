# List of qualifiers

Each device has an identifier that allows to recognize it's kind and should be unique.

A qualifier is composed of 2 bytes and therefore a number from 0 to 65535.

It can be set using the `uq`command.

You can also display this number as 2 bytes and therefore as 2 ascii code.

In the case of the bioreactor the first ascii code is `$`.

You may for example give the following code to the bioreactor

* $A = 9281 = 0x2441
* $B = 9282 = 0x2442
* $C = 9283 = 0x2443
* $D = 9284 = 0x2444
* $E = 9285 = 0x2445
* ...

Each code will correspond to a database name so that is really needs to be unique !

You may convert from the 2 letters code to a number using the following javascript code (you may use it in the browser console.

'$'.charCodeAt(0)*256+'A'.charCodeAt(0)

In the logs this ID will appear as hexa decimal code. You may convert from deciaml to hexadecimal in javascript using the following code:

Number(9281).toString(16)

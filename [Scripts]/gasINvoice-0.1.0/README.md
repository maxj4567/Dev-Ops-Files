# gasINvoice

![gasINvoice](https://i.imgur.com/5boKzq7.png)

This is just a beta version soon there will be more like showing all previous transactions and option to collect and save fuel

Addint to FRFuel:

- Play sound when finish to fill fuel
- Charges the user with the cost of fuel
- If the user doesn't have enough money then money down from the bank account and he becomes wanted
- Displays an invoice on the screen
- Save data [place of gas station, amount of liters, cost, plate number and time]

## Requirements

1. esx_datastore
2. FRFuel

## Installation

1. Download latest release of [gasINvoice](https://github.com/TgMrP/gasINvoice)
2. Drag & Drop contents of `gasINvoice.zip` to your resources folder
3. Import database.sql in your database
4. Add gasINvoice to your server.cfg: `ensure gasINvoice`

## Configuration

> config.json

- perLiter (float) - cost price per liter;
- wantedLVL (0-6) - wanted level stars if there is not enough money;
- volume - The volume of the sound;

## ...

If you have any ideas, requests or anything else I would love to hear :)

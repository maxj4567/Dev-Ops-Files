const config = require("./config.json");

global.perLiter = config.perLiter;
global.wantedLVL = config.wantedLVL;
global.volume = config.volume;

let ESX = null;

emit("esx:getSharedObject", (obj) => (ESX = obj));

onNet("frfuel:fuelAdded", async (amount) => {
  amount = Math.round(amount * 100) / 100;
  const xPlayer = ESX.GetPlayerFromId(source);
  const cash = xPlayer.getMoney();
  const cost = Math.floor(amount * perLiter);

  emitNet("gasINvoice:showFuel", source, amount, cost);

  if (cash < cost) {
    xPlayer.setMoney(0);
    xPlayer.removeAccountMoney("bank", cost);
    emitNet("gasINvoice:wanted", source, wantedLVL);
  } else {
    xPlayer.removeMoney(cost);
  }

  // play sound
  emitNet("gasINvoice:playOne", source, "fuel", volume);
});

onNet("gasINvoice:store", (object) => {
  const xPlayer = ESX.GetPlayerFromId(source);
  emit("esx_datastore:getDataStore", "gas_station", xPlayer.getIdentifier(), function (store) {
    let invoices = store.get("invoices");
    if (!invoices) {
      invoices = [];
    } else {
      invoices = JSON.parse(invoices);
    }

    invoices.push(object);

    store.set("invoices", JSON.stringify(invoices));
  });
});

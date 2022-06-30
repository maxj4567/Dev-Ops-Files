let ESX = null;

emit("esx:getSharedObject", (obj) => (ESX = obj));

onNet("gasINvoice:showFuel", (amount, cost) => {
  const ped = PlayerPedId();
  const pedPosition = GetEntityCoords(ped, false);
  const streetHash = GetStreetNameAtCoord(pedPosition[0], pedPosition[1], pedPosition[2]);
  const address = GetStreetNameFromHashKey(streetHash[0]);
  const address1 = GetStreetNameFromHashKey(streetHash[1]);
  const PlateTEXT = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false));

  const object = {
    amount: amount,
    cost: cost,
    PlateTEXT: PlateTEXT,
    address: `${address}, ${address1}`,
    time: new Date().getTime(),
  };

  SendNuiMessage(
    JSON.stringify({
      transactionType: "showFuel",
      ...object,
    })
  );

  emitNet("gasINvoice:store", object);
});

onNet("gasINvoice:playOne", (soundFile, soundVolume) => {
  SendNuiMessage(
    JSON.stringify({
      transactionType: "playSound",
      transactionFile: soundFile,
      transactionVolume: soundVolume,
    })
  );
});

onNet("gasINvoice:wanted", (lvl) => {
  SetPlayerWantedLevel(PlayerId(), parseInt(lvl), false);
  SetPlayerWantedLevelNow(PlayerId(), true);
});

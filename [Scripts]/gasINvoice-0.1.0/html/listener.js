var audioPlayer = null;

function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? "pm" : "am";
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? "0" + minutes : minutes;
  var strTime = hours + ":" + minutes + " " + ampm;
  return strTime;
}

function formatDate(date) {
  const year = date.getFullYear();
  let month = date.getMonth();
  let day = date.getDate();

  month = month > 9 ? month : `0${month}`;
  day = day > 9 ? day : `0${day}`;

  return `${day}/${month}/${year}`;
}

window.addEventListener("message", function (event) {
  if (event.data.transactionType == "playSound") {
    if (audioPlayer != null) {
      audioPlayer.pause();
    }

    audioPlayer = new Howl({
      src: ["./sounds/" + event.data.transactionFile + ".wav"],
    });
    audioPlayer.volume(event.data.transactionVolume);
    audioPlayer.play();
  } else if (event.data.transactionType == "showFuel") {
    const perLiter = Math.round((event.data.cost / event.data.amount) * 100) / 100;

    let date = new Date(event.data.time);
    let time = formatAMPM(date);
    date = formatDate(date);

    document.getElementById("date").innerHTML = date;
    document.getElementById("time").innerHTML = time;

    const fuelDiv = document.getElementById("fuel");
    const cost = document.getElementById("cost");
    const amount = document.getElementById("amount");
    const address = document.getElementById("address");
    const perL = document.getElementById("perL");
    const PlateTEXT = document.getElementById("PlateTEXT");

    cost.innerHTML = event.data.cost;
    amount.innerHTML = event.data.amount;
    perL.innerHTML = perLiter;
    PlateTEXT.innerHTML = event.data.PlateTEXT;

    address.innerHTML = event.data.address;
    fuelDiv.style.display = "flex";
    setTimeout(() => {
      fuelDiv.style.display = "none";
    }, 5000);
  }
});

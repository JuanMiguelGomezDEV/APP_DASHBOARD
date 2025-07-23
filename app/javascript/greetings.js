<script>
  document.addEventListener("DOMContentLoaded", function () {
    const greetingsByTime = {
      morning: ["Buenos días", "Good morning", "Bonjour", "Bom dia", "Guten Morgen", "Buongiorno", "おはようございます", "صباح الخير"],
      afternoon: ["Buenas tardes", "Good afternoon", "Bon après-midi", "Boa tarde", "Guten Tag", "Buon pomeriggio", "مساء الخير"],
      evening: ["Buenas noches", "Good evening", "Bonsoir", "Boa noite", "Guten Abend", "Buona sera", "こんばんは", "ليلة سعيدة"]
    };

    const miamiTime = new Date().toLocaleString("en-US", { timeZone: "America/New_York" });
    const hour = new Date(miamiTime).getHours();

    let greetingsList = [];
    if (hour >= 5 && hour < 12) {
      greetingsList = greetingsByTime.morning;
    } else if (hour >= 12 && hour < 18) {
      greetingsList = greetingsByTime.afternoon;
    } else {
      greetingsList = greetingsByTime.evening;
    }

    const target = document.getElementById("rotatingGreeting");
    let index = 0;

    function rotateGreeting() {
      target.style.opacity = 0;
      setTimeout(() => {
        target.textContent = greetingsList[index];
        target.style.opacity = 1;
        index = (index + 1) % greetingsList.length;
      }, 1000); // espera 1s antes de cambiar el texto
    }

    rotateGreeting(); // mostrar el primero

    setInterval(rotateGreeting, 4000); // cada 4 segundos cambia
  });
</script>

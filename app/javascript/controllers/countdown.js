document.addEventListener("DOMContentLoaded", function () {
  const countdownElement = document.getElementById("countdown");
  if (!countdownElement) return;

  const eventDate = new Date(countdownElement.dataset.eventDate);

  function updateCountdown() {
    const now = new Date();
    const timeLeft = eventDate - now;

    if (timeLeft <= 0) {
      countdownElement.textContent = "The event has started!";
      clearInterval(interval);
      return;
    }

     const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
    const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);


    countdownElement.textContent = `${days}d ${hours}h ${minutes}m ${seconds}s`;
  }


  const interval = setInterval(updateCountdown, 1000);
  updateCountdown();
});

import ScrollReveal from "scrollreveal";

window.sr = ScrollReveal({
  distance: "60px",
  duration: 800,
  easing: "ease-in-out",
  reset: false,
  viewFactor: 0.2,
});

sr.reveal(".hero__content", {
  origin: "bottom",
  distance: "80px",
  duration: 1000,
});

sr.reveal(".section__header", {
  origin: "top",
  distance: "40px",
  interval: 100,
});

sr.reveal(".history__timeline > *", {
  origin: "left",
  interval: 200,
});

sr.reveal(".history__highlight", {
  origin: "bottom",
  interval: 100,
  distance: "30px",
});

sr.reveal(".landscape-card", {
  origin: "bottom",
  interval: 150,
  distance: "50px",
});

sr.reveal(".gastronomy__featured > *", {
  origin: "left",
  interval: 200,
});

sr.reveal(".dish-card", {
  origin: "bottom",
  interval: 100,
  distance: "40px",
});

sr.reveal(".news-card", {
  origin: "bottom",
  interval: 150,
  distance: "50px",
});

sr.reveal(".footer__section", {
  origin: "bottom",
  interval: 100,
  distance: "40px",
});

sr.reveal(".footer__bottom", {
  origin: "bottom",
  delay: 300,
});

const navToggle = document.getElementById("nav-toggle");
const navMenu = document.getElementById("nav-menu");

if (navToggle && navMenu) {
  navToggle.addEventListener("click", () => {
    navMenu.classList.toggle("show");
    const isExpanded = navMenu.classList.contains("show");
    navToggle.setAttribute("aria-expanded", isExpanded);
  });

  const navLinks = document.querySelectorAll(".nav__link");
  navLinks.forEach((link) => {
    link.addEventListener("click", () => {
      navMenu.classList.remove("show");
      navToggle.setAttribute("aria-expanded", "false");
    });
  });
}

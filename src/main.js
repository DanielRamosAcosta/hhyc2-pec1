import ScrollReveal from "scrollreveal";

// ============================================
// ScrollReveal Configuration
// ============================================
window.sr = ScrollReveal({
  distance: "60px",
  duration: 800,
  easing: "ease-in-out",
  reset: false,
  viewFactor: 0.2,
});

// Hero Section
sr.reveal(".hero__content", {
  origin: "bottom",
  distance: "80px",
  duration: 1000,
});

// Section Headers
sr.reveal(".section__header", {
  origin: "top",
  distance: "40px",
  interval: 100,
});

// History Section
sr.reveal(".history__timeline > *", {
  origin: "left",
  interval: 200,
});

sr.reveal(".history__highlight", {
  origin: "bottom",
  interval: 100,
  distance: "30px",
});

// Landscape Cards
sr.reveal(".landscape-card", {
  origin: "bottom",
  interval: 150,
  distance: "50px",
});

// Gastronomy Section
sr.reveal(".gastronomy__featured > *", {
  origin: "left",
  interval: 200,
});

sr.reveal(".dish-card", {
  origin: "bottom",
  interval: 100,
  distance: "40px",
});

// News Cards
sr.reveal(".news-card", {
  origin: "bottom",
  interval: 150,
  distance: "50px",
});

// Footer
sr.reveal(".footer__section", {
  origin: "bottom",
  interval: 100,
  distance: "40px",
});

sr.reveal(".footer__bottom", {
  origin: "bottom",
  delay: 300,
});

// ============================================
// Navigation Toggle (Hamburger Menu)
// ============================================
const navToggle = document.getElementById("nav-toggle");
const navMenu = document.getElementById("nav-menu");

if (navToggle && navMenu) {
  navToggle.addEventListener("click", () => {
    navMenu.classList.toggle("show");
    const isExpanded = navMenu.classList.contains("show");
    navToggle.setAttribute("aria-expanded", isExpanded);
  });

  // Close menu when clicking nav links
  const navLinks = document.querySelectorAll(".nav__link");
  navLinks.forEach((link) => {
    link.addEventListener("click", () => {
      navMenu.classList.remove("show");
      navToggle.setAttribute("aria-expanded", "false");
    });
  });
}

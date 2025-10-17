import ScrollReveal from "scrollreveal";

// Initialize ScrollReveal (will be configured in later phases)
window.sr = ScrollReveal({
  distance: "60px",
  duration: 800,
  easing: "ease-in-out",
  reset: false,
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

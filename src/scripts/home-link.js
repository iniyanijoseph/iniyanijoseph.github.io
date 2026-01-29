// home-link.js - Add Home link to navbar
document.addEventListener('DOMContentLoaded', function() {
  // Wait for navbar to be created
  setTimeout(() => {
    const navLinks = document.querySelector('.nav-links');
    if (!navLinks) return;
    
    // Add home link at the beginning
    const homeLink = document.createElement('a');
    homeLink.href = '../../';
    homeLink.textContent = 'Back';
    navLinks.appendChild(homeLink);
  }, 50);
});

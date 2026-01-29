// cv-link.js - Add CV link to navbar
document.addEventListener('DOMContentLoaded', function() {
  // Wait for navbar to be created
  setTimeout(() => {
    const navLinks = document.querySelector('.nav-links');
    if (!navLinks) return;
    
    // Add CV link
    const cvLink = document.createElement('a');
    cvLink.href = 'cv.pdf';
    cvLink.textContent = 'CV';
    cvLink.target = '_blank';
    navLinks.appendChild(cvLink);
  }, 50);
});

// blog-link.js - Add Blog link to navbar
document.addEventListener('DOMContentLoaded', function() {
  // Wait for navbar to be created
  setTimeout(() => {
    const navLinks = document.querySelector('.nav-links');
    if (!navLinks) return;
    
    // Add blog link
    const blogLink = document.createElement('a');
    blogLink.href = 'blog/index.html';
    blogLink.textContent = 'Blog';
    navLinks.appendChild(blogLink);
  }, 50);
});

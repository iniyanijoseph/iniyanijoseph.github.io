// Auto-generate navbar from h3 elements
document.addEventListener('DOMContentLoaded', function() {
  // Get all h3 elements
  const h3Elements = document.querySelectorAll('h3');
  
  // Create navbar
  const navbar = document.createElement('nav');
  navbar.className = 'navbar';
  
  // Generate IDs and links for each h3
  h3Elements.forEach((h3, index) => {
    // Create ID from h3 text (lowercase, replace spaces with hyphens)
    const id = h3.textContent.trim().toLowerCase().replace(/\s+/g, '-').replace(/[&]/g, 'and');
    h3.id = id;
    
    // Create navbar link
    const link = document.createElement('a');
    link.href = '#' + id;
    link.textContent = h3.textContent.trim();
    
    navbar.appendChild(link);
  });
  
  // Insert navbar at the beginning of body
  document.body.insertBefore(navbar, document.body.firstChild);
});

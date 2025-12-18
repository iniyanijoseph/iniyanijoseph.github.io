// Auto-generate navbar from h3 elements with hamburger menu for mobile
document.addEventListener('DOMContentLoaded', function() {
  // Get all h3 elements
  const h3Elements = document.querySelectorAll('h3');
  
  // Create navbar container
  const navbar = document.createElement('nav');
  navbar.className = 'navbar';
  
  // Create hamburger button
  const hamburger = document.createElement('button');
  hamburger.className = 'hamburger';
  hamburger.setAttribute('aria-label', 'Toggle menu');
  hamburger.innerHTML = `
    <span></span>
    <span></span>
    <span></span>
  `;
  
  // Create nav links container
  const navLinks = document.createElement('div');
  navLinks.className = 'nav-links';
  
  // Generate IDs and links for each h3
  h3Elements.forEach((h3, index) => {
    // Create ID from h3 text (lowercase, replace spaces with hyphens)
    const id = h3.textContent.trim().toLowerCase().replace(/\s+/g, '-').replace(/[&]/g, 'and');
    h3.id = id;
    
    // Create navbar link
    const link = document.createElement('a');
    link.href = '#' + id;
    link.textContent = h3.textContent.trim();
    
    navLinks.appendChild(link);
  });
  
  // Add CV link at the end
  const cvLink = document.createElement('a');
  cvLink.href = 'cv.pdf';
  cvLink.textContent = 'CV';
  cvLink.target = '_blank';
  navLinks.appendChild(cvLink);
  
  // Append hamburger and links to navbar
  navbar.appendChild(hamburger);
  navbar.appendChild(navLinks);
  
  // Insert navbar at the beginning of body
  document.body.insertBefore(navbar, document.body.firstChild);
  
  // Toggle menu functionality
  hamburger.addEventListener('click', function() {
    navbar.classList.toggle('active');
  });
  
  // Close menu when clicking a link
  navLinks.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', function() {
      navbar.classList.remove('active');
    });
  });
  
  // Close menu when clicking outside
  document.addEventListener('click', function(event) {
    if (!navbar.contains(event.target)) {
      navbar.classList.remove('active');
    }
  });
  
  // Function to update padding based on navbar height
  function updatePadding() {
    const navbarHeight = navbar.offsetHeight;
    const additionalOffset = 20;

    document.body.style.paddingTop = (navbarHeight + additionalOffset) + 'px';
    document.documentElement.style.scrollPaddingTop = (navbarHeight + additionalOffset) + 'px';
  }
  
  // Update padding after navbar is rendered
  updatePadding();
  
  // Update padding on window resize (in case navbar wraps)
  window.addEventListener('resize', updatePadding);
});

// scroll-animation.js - Animate cards as they scroll into view

document.addEventListener('DOMContentLoaded', function() {
  // Create intersection observer for cards
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-in');
        observer.unobserve(entry.target);
      }
    });
  }, {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  });

  // Observe all list items
  const listItems = document.querySelectorAll('ul li');
  listItems.forEach(item => observer.observe(item));

  // Observe all table rows (excluding detail rows)
  const tableRows = document.querySelectorAll('.twopanel tr:not(.detail-row)');
  tableRows.forEach(row => observer.observe(row));

  // Sticky headers functionality
  const h3Elements = document.querySelectorAll('h3');
  
  h3Elements.forEach((h3, index) => {
    // Wrap h3 in a sticky container
    const stickyWrapper = document.createElement('div');
    stickyWrapper.className = 'sticky-header-wrapper';
    
    // Transfer the ID from h3 to wrapper so anchor links work
    if (h3.id) {
      stickyWrapper.id = h3.id;
      h3.removeAttribute('id');
    }
    
    h3.parentNode.insertBefore(stickyWrapper, h3);
    stickyWrapper.appendChild(h3);
    
    // Find the next h3 or end of document to determine section bounds
    const nextH3 = h3Elements[index + 1];
    const sectionEnd = nextH3 || document.body.lastElementChild;
    
    // Observer to track when section is in view
    const sectionObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          h3.classList.add('sticky-active');
        } else {
          h3.classList.remove('sticky-active');
        }
      });
    }, {
      threshold: 0,
      rootMargin: '-80px 0px -80% 0px'
    });
    
    sectionObserver.observe(stickyWrapper);
  });

  // Parallax star background
  createStarBackground();
});

function createStarBackground() {
  const canvas = document.createElement('canvas');
  canvas.id = 'star-background';
  canvas.style.position = 'fixed';
  canvas.style.top = '0';
  canvas.style.left = '0';
  canvas.style.width = '100%';
  canvas.style.height = '100%';
  canvas.style.zIndex = '-1';
  canvas.style.pointerEvents = 'none';
  document.body.appendChild(canvas);
  
  const ctx = canvas.getContext('2d');
  
  function resizeCanvas() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    generateStars();
  }
  
  const stars = [];
  
  function generateStars() {
    stars.length = 0;
    const numStars = Math.floor((canvas.width * canvas.height) / 8000);
    
    for (let i = 0; i < numStars; i++) {
      stars.push({
        x: Math.random() * canvas.width,
        y: Math.random() * canvas.height,
        baseY: Math.random() * canvas.height,
        radius: Math.random() * 1.8 + 0.6,
        opacity: Math.random() * 0.6 + 0.4,
        speed: Math.random() * 0.3 + 0.1,
        twinkleSpeed: Math.random() * 0.02 + 0.01,
        twinklePhase: Math.random() * Math.PI * 2
      });
    }
  }
  
  window.addEventListener('resize', resizeCanvas);
  resizeCanvas();
  
  window.updateParallax = function() {
    const scrollY = window.pageYOffset;
    const time = Date.now() * 0.001;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    stars.forEach(star => {
      const parallaxOffset = scrollY * star.speed * 0.15;
      const newY = (star.baseY + parallaxOffset) % (canvas.height + 100) - 50;
      
      // Twinkling effect
      const twinkle = Math.sin(time * star.twinkleSpeed + star.twinklePhase) * 0.3 + 1;
      const adjustedOpacity = star.opacity * twinkle;
      
      ctx.beginPath();
      ctx.arc(star.x, newY, star.radius, 0, Math.PI * 2);
      ctx.fillStyle = `rgba(200, 220, 255, ${adjustedOpacity})`;
      ctx.fill();
    });
    
    requestAnimationFrame(updateParallax);
  };
  
  updateParallax();
}

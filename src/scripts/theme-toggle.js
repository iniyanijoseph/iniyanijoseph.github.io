// theme-toggle.js - Dark/Light mode toggle
document.addEventListener('DOMContentLoaded', function() {
  // Wait for navbar to be created
  setTimeout(() => {
    const navLinks = document.querySelector('.nav-links');
    if (!navLinks) return;
    
    // Create toggle button
    const toggleBtn = document.createElement('button');
    toggleBtn.className = 'theme-toggle-btn';
    toggleBtn.setAttribute('aria-label', 'Toggle theme');
    toggleBtn.innerHTML = '☀️';
    
    // Add to nav links
    navLinks.appendChild(toggleBtn);
    
    // Check saved theme or default to dark
    const savedTheme = localStorage.getItem('theme') || 'dark';
    document.documentElement.setAttribute('data-theme', savedTheme);
    updateToggleText(toggleBtn, savedTheme);
    
    // Toggle handler
    toggleBtn.addEventListener('click', () => {
      const current = document.documentElement.getAttribute('data-theme');
      const newTheme = current === 'dark' ? 'light' : 'dark';
      document.documentElement.setAttribute('data-theme', newTheme);
      localStorage.setItem('theme', newTheme);
      updateToggleText(toggleBtn, newTheme);
      
      // Reset card colors when switching to dark mode
      if (newTheme === 'dark') {
        document.documentElement.style.removeProperty('--bg-card');
      }
      
      // Close mobile menu
      document.querySelector('.navbar').classList.remove('active');
      
      // Handle canvas
      const starsCanvas = document.getElementById('star-background');
      const sunCanvas = document.getElementById('sun-background');
      
      if (newTheme === 'light') {
        if (starsCanvas) starsCanvas.style.display = 'none';
        if (!sunCanvas) createSunBackground();
      } else {
        if (starsCanvas) starsCanvas.style.display = 'block';
        if (sunCanvas) sunCanvas.remove();
      }
    });
    
    function updateToggleText(btn, theme) {
      const isMobile = window.innerWidth <= 768;
      if (isMobile) {
        btn.innerHTML = theme === 'dark' ? '☀️ Light Mode' : '🌙 Dark Mode';
      } else {
        btn.innerHTML = theme === 'dark' ? '☀️' : '🌙';
      }
    }
    
    // Update on resize
    window.addEventListener('resize', () => {
      updateToggleText(toggleBtn, document.documentElement.getAttribute('data-theme'));
    });
    
    // Update text on resize
    window.addEventListener('resize', () => {
      updateToggleText(toggleBtn, document.documentElement.getAttribute('data-theme'));
    });
    
    // Initialize light mode if needed
    if (savedTheme === 'light') {
      const starsCanvas = document.getElementById('star-background');
      if (starsCanvas) starsCanvas.style.display = 'none';
      createSunBackground();
    }
  }, 100);
});

function createSunBackground() {
  const canvas = document.createElement('canvas');
  canvas.id = 'sun-background';
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
    drawSun();
  }
  
  function drawSun() {
    const scrollY = window.pageYOffset;
    const maxScroll = document.documentElement.scrollHeight - window.innerHeight;
    const scrollProgress = Math.min(scrollY / maxScroll, 1);
    
    // Smooth gradient transitions - mostly white with subtle warmth
    const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
    
    // Dawn to Day (0 - 0.5)
    if (scrollProgress < 0.5) {
      const t = scrollProgress / 0.5;
      // Dawn: very pale peachy white -> bright sky blue
      gradient.addColorStop(0, `rgb(${240 + t * 15}, ${235 + t * 20}, ${230 + t * 25})`);
      gradient.addColorStop(0.6, `rgb(${245 + t * 10}, ${242 + t * 13}, ${238 + t * 17})`);
      gradient.addColorStop(1, `rgb(${248 + t * 7}, ${245 + t * 10}, ${242 + t * 13})`);
    } else {
      // Day to Dusk (0.5 - 1.0)
      const t = (scrollProgress - 0.5) / 0.5;
      // Bright day -> very pale warm dusk
      gradient.addColorStop(0, `rgb(${255 - t * 15}, ${255 - t * 20}, ${255 - t * 25})`);
      gradient.addColorStop(0.6, `rgb(${255 - t * 10}, ${255 - t * 13}, ${255 - t * 17})`);
      gradient.addColorStop(1, `rgb(${255 - t * 7}, ${255 - t * 10}, ${255 - t * 13})`);
    }
    
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    updateCardColors(scrollProgress);
    
    // Sun position in semicircle arc
    const angle = Math.PI * scrollProgress;
    const arcRadius = Math.min(canvas.width, canvas.height) * 0.6;
    const centerX = canvas.width / 2;
    const centerY = canvas.height;
    
    const sunX = centerX + Math.cos(Math.PI - angle) * arcRadius;
    const sunY = centerY - Math.sin(angle) * arcRadius;
    const sunRadius = 50 + Math.sin(angle) * 15;
    
    // Sun glow
    const glowGradient = ctx.createRadialGradient(sunX, sunY, sunRadius * 0.3, sunX, sunY, sunRadius * 2.5);
    glowGradient.addColorStop(0, 'rgba(255, 240, 180, 0.6)');
    glowGradient.addColorStop(1, 'rgba(255, 200, 100, 0)');
    ctx.fillStyle = glowGradient;
    ctx.beginPath();
    ctx.arc(sunX, sunY, sunRadius * 2.5, 0, Math.PI * 2);
    ctx.fill();
    
    // Sun color - gradual transition
    const r = 255;
    const g = Math.floor(240 - scrollProgress * 90);
    const b = Math.floor(200 - scrollProgress * 120);
    ctx.fillStyle = `rgb(${r}, ${g}, ${b})`;
    
    ctx.beginPath();
    ctx.arc(sunX, sunY, sunRadius, 0, Math.PI * 2);
    ctx.fill();
  }
  
  function updateCardColors(progress) {
    // Only update in light mode
    if (document.documentElement.getAttribute('data-theme') !== 'light') return;
    
    const root = document.documentElement;
    // Gradual shift: peachy dawn -> pure white -> warm dusk
    const r = 255;
    const g = Math.floor(245 + (progress < 0.5 ? progress * 20 : (1 - progress) * 20));
    const b = Math.floor(240 + (progress < 0.5 ? progress * 30 : (1 - progress) * 40));
    root.style.setProperty('--bg-card', `rgba(${r}, ${g}, ${b}, 0.8)`);
  }
  
  window.addEventListener('resize', resizeCanvas);
  window.addEventListener('scroll', drawSun);
  resizeCanvas();
}

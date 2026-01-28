// theme-toggle.js - Dark/Light mode toggle
document.addEventListener('DOMContentLoaded', function() {
  // Create toggle button
  const toggleBtn = document.createElement('button');
  toggleBtn.className = 'theme-toggle';
  toggleBtn.setAttribute('aria-label', 'Toggle theme');
  toggleBtn.innerHTML = '☀️';
  document.body.appendChild(toggleBtn);
  
  // Check saved theme or default to dark
  const savedTheme = localStorage.getItem('theme') || 'dark';
  document.documentElement.setAttribute('data-theme', savedTheme);
  updateToggleIcon(savedTheme);
  
  // Toggle handler
  toggleBtn.addEventListener('click', () => {
    const current = document.documentElement.getAttribute('data-theme');
    const newTheme = current === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
    updateToggleIcon(newTheme);
    
    // Handle stars canvas
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
  
  function updateToggleIcon(theme) {
    toggleBtn.innerHTML = theme === 'dark' ? '☀️' : '🌙';
  }
  
  // Initialize light mode if needed
  if (savedTheme === 'light') {
    const starsCanvas = document.getElementById('star-background');
    if (starsCanvas) starsCanvas.style.display = 'none';
    createSunBackground();
  }
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
    
    // Gradient from sunrise to sunset
    const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
    
    if (scrollProgress < 0.5) {
      // Sunrise (morning)
      const t = scrollProgress * 2;
      gradient.addColorStop(0, `rgba(255, ${150 + t * 100}, ${100 + t * 150}, 1)`);
      gradient.addColorStop(0.5, `rgba(255, ${200 + t * 50}, ${180 + t * 70}, 1)`);
      gradient.addColorStop(1, `rgba(255, ${220 + t * 30}, ${200 + t * 40}, 1)`);
    } else {
      // Sunset (evening)
      const t = (scrollProgress - 0.5) * 2;
      gradient.addColorStop(0, `rgba(${255 - t * 100}, ${150 - t * 80}, ${150 - t * 100}, 1)`);
      gradient.addColorStop(0.5, `rgba(${255 - t * 50}, ${180 - t * 100}, ${100 - t * 80}, 1)`);
      gradient.addColorStop(1, `rgba(${240 - t * 80}, ${160 - t * 100}, ${80 - t * 60}, 1)`);
    }
    
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    // Sun position
    const sunY = canvas.height * 0.3 + scrollProgress * canvas.height * 0.4;
    const sunX = canvas.width / 2;
    const sunRadius = 80;
    
    // Sun glow
    const glowGradient = ctx.createRadialGradient(sunX, sunY, sunRadius * 0.5, sunX, sunY, sunRadius * 3);
    glowGradient.addColorStop(0, 'rgba(255, 255, 200, 0.4)');
    glowGradient.addColorStop(1, 'rgba(255, 255, 200, 0)');
    ctx.fillStyle = glowGradient;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    // Sun
    ctx.beginPath();
    ctx.arc(sunX, sunY, sunRadius, 0, Math.PI * 2);
    ctx.fillStyle = scrollProgress < 0.5 ? '#FFE66D' : '#FF6B6B';
    ctx.fill();
  }
  
  window.addEventListener('resize', resizeCanvas);
  window.addEventListener('scroll', drawSun);
  resizeCanvas();
}

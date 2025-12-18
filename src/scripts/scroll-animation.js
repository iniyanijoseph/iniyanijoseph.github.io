// scroll-animation.js - Animate cards as they scroll into view

document.addEventListener('DOMContentLoaded', function() {
  // Create intersection observer
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-in');
        // Optionally unobserve after animation
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
});

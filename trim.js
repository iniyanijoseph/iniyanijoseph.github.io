// Remove leading commas and spaces from descriptions
document.addEventListener('DOMContentLoaded', function() {
  // Get all panelcontent cells
  const panelContents = document.querySelectorAll('.panelcontent');
  
  panelContents.forEach(cell => {
    // Get all text nodes that come after <strong> tags
    const walker = document.createTreeWalker(
      cell,
      NodeFilter.SHOW_TEXT,
      null,
      false
    );
    
    let node;
    while (node = walker.nextNode()) {
      // Check if this text node comes after a strong tag
      if (node.previousSibling && node.previousSibling.nodeName === 'STRONG') {
        // Trim leading commas and spaces
        node.textContent = node.textContent.replace(/^[,\s]+/, '');
      }
    }
  });
});


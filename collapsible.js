// Add collapsible functionality to table rows that have detail rows
document.addEventListener('DOMContentLoaded', function() {
  const tables = document.querySelectorAll('.twopanel');
  
  tables.forEach(table => {
    const rows = Array.from(table.querySelectorAll('tr'));
    
    for (let i = 0; i < rows.length; i++) {
      const row = rows[i];
      
      // Skip if this is a detail row
      if (row.classList.contains('detail-row')) {
        continue;
      }
      
      // Check if the next row is a detail row
      const nextRow = rows[i + 1];
      if (nextRow && nextRow.classList.contains('detail-row')) {
        // Move detail row inside the main row's parent cell structure
        const mainCard = row;
        nextRow.style.display = 'none';
        
        // Add click handler to main row
        row.style.cursor = 'pointer';
        row.addEventListener('click', function(e) {
          // Prevent clicks on links from toggling
          if (e.target.tagName === 'A') {
            return;
          }
          
          if (nextRow.style.display === 'none') {
            nextRow.style.display = 'flex';
            row.classList.add('expanded');
          } else {
            nextRow.style.display = 'none';
            row.classList.remove('expanded');
          }
        });
        
        // Skip the detail row in the next iteration
        i++;
      }
    }
  });
});

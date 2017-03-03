-- Load the MIAA Fantasy Basketball database. 
-- Ethan Clark - CS 342

-- Drop the previous table declarations.
@&athlete\drop         
commit;
-- Reload the table declarations.
@&athlete\schema
commit;
-- Load the table data.
@&athlete\data
commit;
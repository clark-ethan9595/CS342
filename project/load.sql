-- Load the Calvin Student-Athlete database. 
-- Ethan Clark - CS 342

-- Drop the previous table declarations.
@&studathlete\drop         
commit;
-- Reload the table declarations.
@&studathlete\schema
commit;
-- Load the table data.
@&studathlete\data
commit;
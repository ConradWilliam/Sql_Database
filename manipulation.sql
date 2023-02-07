--@BLOCK
UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

--@BLOCK
ALTER TABLE celebs
ADD COLUMN twitter_handle TEXT;

--@BLOCK
 DELETE FROM celebs
 WHERE twitter_handle IS NULL;
CREATE OR REPLACE function F1 (a integer)
RETURNS integer as $$
DECLARE
ret integer := 0;
BEGIN
	if (a <= 2)
	THEN
		return a;
	ELSE
		return a * F1(a-1);
		END IF;
	RAISE Notice 'a is %',a;
	RETURN 0;
END
$$ language "plpgsql";

select * from F1(3);

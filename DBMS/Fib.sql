CREATE OR REPLACE FUNCTION F2(counte integer) returns integer
as $$
DECLARE
BEGIN
	if (counte <= 0)
	THEN
		return 0;
	END IF;
	if (counte <= 1)
	THEN
		return 1;
	END IF;
	return F2(counte-1) + F2(counte-2);
end;
$$ language "plpgsql";

CREATE OR REPLACE FUNCTION F3(counte integer) returns integer
as $$
DECLARE
BEGIN
	while (counte >= 0)
	LOOP
		RAISE NOTICE 'Fib at % is %', counte, F2(counte);
		counte = counte - 1;
	END LOOP;
end;
$$ language "plpgsql";


SELECT FROM F3(4);

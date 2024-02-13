SELECT 
    a.id,
    b.age,
    a.coins_needed,
    a.power 
FROM 
    wands AS a
INNER JOIN 
    wands_property AS b ON a.code = b.code
INNER JOIN 
    (
        SELECT 
            MIN(coins_needed) AS min_coin,
            age,
            power 
        FROM 
            wands AS a
        INNER JOIN 
            wands_property AS b ON a.code = b.code 
        GROUP BY 
            2,3 
    ) AS c ON a.coins_needed = c.min_coin 
             AND a.power = c.power 
             AND b.age = c.age 
WHERE 
    is_evil = 0 
ORDER BY 
    a.power DESC,
    b.age DESC;

SELECT c.id, p.id
FROM {{ ref('hacker_news_formatted') }} AS c
LEFT JOIN {{ ref('hacker_news_formatted') }} AS p
    ON c.parent = p.id
WHERE p.time_ts < c.time_ts

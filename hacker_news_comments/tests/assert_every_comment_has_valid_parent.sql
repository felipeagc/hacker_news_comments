SELECT id
FROM {{ ref('hacker_news_formatted') }}
WHERE NOT EXISTS (
    SELECT c.id
    FROM {{ ref('hacker_news_formatted') }} AS c
    LEFT JOIN {{ ref('hacker_news_formatted') }} AS p
        ON c.parent = p.id
)

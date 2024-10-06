SELECT
    c.id,
    p.id
FROM {{ ref('hacker_news_formatted') }} AS c
LEFT JOIN {{ ref('hacker_news_formatted') }} AS p
    ON c.parent = p.id
WHERE c.title <> p.title OR c.text <> p.text

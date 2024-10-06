SELECT
    title,
    comment_author,
    comment_text,
    time_ts
FROM {{ ref('hacker_news_formatted') }}
WHERE
    time_ts > ((SELECT MAX(time_ts) FROM {{ ref('hacker_news_formatted') }}) - INTERVAL 3 MONTH)

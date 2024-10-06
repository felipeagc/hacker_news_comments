SELECT comment_ranking
FROM {{ ref('hacker_news_formatted') }}
WHERE comment_ranking < 0 OR score < 0

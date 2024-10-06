SELECT
	id,
	parent,
	comment_author,
	title,
	author,
	comment_text,
	text,
	comment_ranking,
	score,
	STRPTIME(time_ts, '%Y-%m-%d %H:%M:%S %Z') AS time_ts
FROM {{ source('hacker_news_raw', 'hacker_news_raw') }}

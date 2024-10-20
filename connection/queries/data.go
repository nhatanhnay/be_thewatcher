package queries

const GET_WATCH_DETAILS = `
	SELECT *
	FROM
		watch_details
	ORDER BY
		id_watch`

const GET_WATCH_BY_CATEGORY = `
	SELECT *
	FROM
		watch_details
	WHERE
		category = %$1
	ORDER BY
		id_watch`

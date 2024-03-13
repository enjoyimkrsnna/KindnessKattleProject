CREATE VIEW UserAnalyticsView AS
SELECT
    u.user_id,
    u.username ,
    u.email_address ,
    u.is_active ,
    COUNT(DISTINCT fdp.post_id  ) AS TotalPostsCreated,
    AVG(fr.rating ) AS AvgRatingReceived,
    COUNT(DISTINCT fr.feedback_rating_id ) AS TotalFeedbacksReceived
FROM
    [dbo].[user_accounts] u
LEFT JOIN
    [dbo].[donation_posts ] fdp ON u.user_id  = fdp.user_id 
LEFT JOIN
    [dbo].[comments] c ON u.user_id = c.user_id
LEFT JOIN
    [dbo].[likes ] lt ON u.user_id = lt.user_id 
LEFT JOIN
    [dbo].[feedback_ratings] fr ON u.user_id = fr.rated_user_id 
LEFT JOIN
    [dbo].[feedback_ratings]   fr2 ON u.user_id = fr2.rating_user_id 
GROUP BY
    u.user_id, u.username, u.email_address, u.is_active;